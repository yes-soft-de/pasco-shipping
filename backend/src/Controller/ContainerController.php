<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerFilterRequest;
use App\Request\ContainerUpdateRequest;
use App\Service\ContainerService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ContainerController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $containerService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ContainerService $containerService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->containerService = $containerService;
    }

    /**
     * @Route("container", name="createContainer", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container")
     * 
     * @OA\RequestBody(
     *      description="Create new container",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new container",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="string", property="status")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ContainerCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("container", name="updateContainer", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Container")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update a specific container",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the container",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
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

        $request = $this->autoMapping->map(stdClass::class, ContainerUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("containers/{status}", name="getContainersByStatus", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container")
     * 
     * @OA\Parameter(
     *      name="status",
     *      in="path",
     *      required="true",
     *      description="the status of the container"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the containers according to the status",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="shipperName"),
     *                  @OA\Property(type="number", property="capacityCPM"),
     *                  @OA\Property(type="number", property="widthInMeter"),
     *                  @OA\Property(type="number", property="hightInMeter"),
     *                  @OA\Property(type="number", property="lengthInMeter"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items()
     *                  )
     *              )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getByStatus($status)
    {
        $result = $this->containerService->getByStatus($status);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("container/{id}", name="getContainerByID", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container")
     * 
     * @OA\Parameter(
     *      name="id",
     *      in="path",
     *      required="true",
     *      description="the id of the container"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the container according to the id",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="shipperName"),
     *                  @OA\Property(type="number", property="capacityCPM"),
     *                  @OA\Property(type="number", property="widthInMeter"),
     *                  @OA\Property(type="number", property="hightInMeter"),
     *                  @OA\Property(type="number", property="lengthInMeter"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="boolean", property="isInOneHolder"),
     *                          @OA\Property(type="boolean", property="packed"),
     *                          @OA\Property(type="string", property="target"),
     *                          @OA\Property(type="integer", property="supplierName"),
     *                          @OA\Property(type="string", property="distributorName"),
     *                          @OA\Property(type="string", property="exportWarehouseName"),
     *                          @OA\Property(type="string", property="importWarehouseName"),
     *                          @OA\Property(type="integer", property="quantity"),
     *                          @OA\Property(type="string", property="image"),
     *                          @OA\Property(type="string", property="productCategoryName"),
     *                          @OA\Property(type="integer", property="unit"),
     *                          @OA\Property(type="string", property="receiverName"),
     *                          @OA\Property(type="string", property="receiverPhoneNumber"),
     *                          @OA\Property(type="string", property="markNumber"),
     *                          @OA\Property(type="integer", property="packetingBy"),
     *                          @OA\Property(type="string", property="paymentTime"),
     *                          @OA\Property(type="number", property="weight"),
     *                          @OA\Property(type="string", property="qrCode"),
     *                          @OA\Property(type="integer", property="guniQuantity"),
     *                          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                          @OA\Property(type="string", property="extraSpecification"),
     *                          @OA\Property(type="string", property="status"),
     *                          @OA\Property(type="text", property="externalWarehouseInfo"),
     *                          @OA\Property(type="boolean", property="isExternalWarehouse")
     *                      )
     *                  )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getContainerById($id)
    {
        $result = $this->containerService->getContainerById($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filtercontainers", name="filterContainers", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Container")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the containers",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="shipperName"),
     *                  @OA\Property(type="number", property="capacityCPM"),
     *                  @OA\Property(type="number", property="widthInMeter"),
     *                  @OA\Property(type="number", property="hightInMeter"),
     *                  @OA\Property(type="number", property="lengthInMeter")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function filterContainers(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ContainerFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerService->filterContainers($request);

        return $this->response($result, self::FETCH);
    }

}