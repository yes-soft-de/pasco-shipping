<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\MessageCreateRequest;
use App\Service\MessageService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MessageController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $messageService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, MessageService $messageService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->messageService = $messageService;
    }

    /**
     * @Route("/message", name="createNewMessageWithAdministration", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Message")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new message with administration",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="userTwoID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new message",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="userOneID"),
     *                  @OA\Property(type="integer", property="userTwoID"),
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

        $request = $this->autoMapping->map(stdClass::class, MessageCreateRequest::class, (object) $data);

        $request->setUserOneID($this->getUserId());
        
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->messageService->chatWithAdministration($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("mymessages", name="getAllMessagesOfSignedInClient", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Message")
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
     *      description="Returns array of messages of the signed-in client",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="roomID"),
     *                  @OA\Property(type="string", property="username"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt")
     *              )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getMyMessages()
    {
        $result = $this->messageService->getChatListOfUser($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/deleteallmessages", name="deleteAllMessages", methods={"DELETE"})
     */
    public function deleteAllMessages()
    {
        $result = $this->messageService->deleteAllMessages();

        return $this->response($result, self::DELETE);
    }

}