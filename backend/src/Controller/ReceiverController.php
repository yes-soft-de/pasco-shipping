<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ReceiverCreateByDashboardRequest;
use App\Request\ReceiverCreateRequest;
use App\Request\ReceiverFilterRequest;
use App\Request\ReceiverUpdateRequest;
use App\Service\ReceiverService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ReceiverController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $receiverService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ReceiverService $receiverService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->receiverService = $receiverService;
    }

    /**
     * @Route("receiver", name="createReceiver", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Receiver")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="string", property="email"),
     *          @OA\Property(type="string", property="address")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ReceiverCreateRequest::class, (object)$data);

        $request->setClientUserID($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->receiverService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("receiverbydashboard", name="createReceiverByDashboard", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Receiver")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="string", property="email"),
     *          @OA\Property(type="string", property="address"),
     *          @OA\Property(type="integer", property="clientUserID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function createByDashboard(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ReceiverCreateByDashboardRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->receiverService->createByDashboard($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("receiver", name="updateReceiverByClient", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Receiver")
     *
     * @OA\RequestBody(
     *      description="Update existing receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="string", property="email"),
     *          @OA\Property(type="string", property="address")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the new info of the receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="email"),
     *                  @OA\Property(type="string", property="address"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ReceiverUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->receiverService->update($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filterreceivers", name="filterReceiversOfClients", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Receiver")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="clientUserID"),
     *          @OA\Property(type="integer", property="createdBy")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get info of the wanted receivers",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *                  @OA\Items(
     *                      @OA\Property(type="string", property="fullName"),
     *                      @OA\Property(type="string", property="phone"),
     *                      @OA\Property(type="string", property="email"),
     *                      @OA\Property(type="string", property="address"),
     *                      @OA\Property(type="string", property="clientUsername"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage"),
     *                      @OA\Property(type="string", property="updatedByUser"),
     *                      @OA\Property(type="string", property="updatedByUserImage")
     *                  )
     *          )
     *      )
     * )
     *
     */
    public function filterReceivers(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ReceiverFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->receiverService->filterReceivers($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("myreceivers", name="getReceiversByClient", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Receiver")
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
     *      description="Get info of the signed-in client's receivers",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *                  @OA\Items(
     *                      @OA\Property(type="string", property="fullName"),
     *                      @OA\Property(type="string", property="phone"),
     *                      @OA\Property(type="string", property="email"),
     *                      @OA\Property(type="string", property="address"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt")
     *                  )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getMyReceivers()
    {
        $result = $this->receiverService->getMyReceivers($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("receiver/{id}", name="deleteReceiver", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Receiver")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted receiver",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="email"),
     *                  @OA\Property(type="string", property="address"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *              )
     *          )
     *      )
     * )
     */
    public function deleteReceiverById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->receiverService->deleteReceiverById($request);

        return $this->response($result, self::DELETE);
    }

}