<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ServiceCreateRequest;
use App\Request\ServiceUpdateRequest;
use App\Service\ServicesService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ServicesController extends BaseController
{
    private $autoMapping;
    private $servicesService;
    private $validator;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
     ServicesService $servicesService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->servicesService = $servicesService;
        $this->validator = $validator;
    }

    /**
     * @Route("subcontractservice", name="createSubcontractService", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Subcontract Service")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new service",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="name"),
     *          @OA\Property(type="string", property="description")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new service",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAT")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     * 
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ServiceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());
        
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->servicesService->create($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("subcontractservice", name="updateExistingService", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Subcontract Service")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Update service request",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="name"),
     *          @OA\Property(type="string", property="description")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new service",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, ServiceUpdateRequest::class, (object) $data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->servicesService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("subcontractservices/{id}", name="getSubcontractServiceByID", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Subcontract Service")
     * 
     * @OA\Parameter(
     *      name="id",
     *      in="header",
     *      description="id of the service to be passed",
     *      required=true 
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns service info",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *             )
     *          )
     *      )
     * )
     * 
     */
    public function getServiceById($id)
    {
        $result = $this->servicesService->getServiceById($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("subcontractservices", name="getAllSubcontractServices", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Subcontract Service")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns all services",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *             )
     *          )
     *      )
     * )
     * 
     */
    public function getServices()
    {
        $result = $this->servicesService->getAllServices();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("subcontractservice/{id}", name="deleteServiceById", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Subcontract Service")
     * 
     * @OA\Parameter(
     *      name="id",
     *      in="header",
     *      description="id of the service to be passed",
     *      required=true 
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted service",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *          )
     *      )
     * )
     * 
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->servicesService->delete($request);

        return $this->response($result, self::DELETE);
    }

}