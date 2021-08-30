<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ChatCreateRequest;
use App\Request\ChatFilterRequest;
use App\Service\ChatService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ChatController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $chatService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ChatService $chatService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->chatService = $chatService;
    }

    /**
     * @Route("chat", name="createChatWithAdministration", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Chat")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     *
     * @OA\RequestBody(
     *      description="Creates a new chat with administration",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="title"),
     *          @OA\Property(type="string", property="description")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new chat",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="userOneID"),
     *                  @OA\Property(type="string", property="roomID"),
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function chatWithAdministration(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ChatCreateRequest::class, (object) $data);

        $request->setUserOneID($this->getUserId());
        
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->chatService->chatWithAdministration($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("mychat", name="getAllChatOfSignedInClient", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Chat")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of chat of the signed-in client",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="roomID"),
     *                  @OA\Property(type="string", property="title"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="string", property="state"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage")
     *              )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getMyChat()
    {
        $result = $this->chatService->getChatByUser($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filterchats", name="filterChats", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Chat")
     *
     * @OA\RequestBody(
     *      description="Filter chats with the following options",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="userOneID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new chat",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="roomID"),
     *                  @OA\Property(type="string", property="title"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="string", property="state"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage")
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function filterChats(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ChatFilterRequest::class, (object) $data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->chatService->filterChats($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("deleteallchats", name="deleteAllChats", methods={"DELETE"})
     */
    public function deleteAllChats()
    {
        $result = $this->chatService->deleteAllChats();

        return $this->response($result, self::DELETE);
    }

}