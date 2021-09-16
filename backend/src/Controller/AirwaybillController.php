<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\AirwaybillCreateRequest;
use App\Request\AirwaybillFilterRequest;
use App\Request\AirwaybillStatusUpdateRequest;
use App\Request\AirwaybillUpdateRequest;
use App\Request\DeleteRequest;
use App\Service\AirwaybillService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AirwaybillController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $airwaybillService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, AirwaybillService $airwaybillService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->airwaybillService = $airwaybillService;
    }

    /**
     * @Route("airwaybill", name="createAirwaybill", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\RequestBody(
     *      description="Create new airwaybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="airwaybillNumber"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID"),
     *          @OA\Property(type="integer", property="carrierID"),
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="integer", property="clientUserID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new airwaybill",
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

        $request = $this->autoMapping->map(stdClass::class, AirwaybillCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("airwaybill", name="updateAirwaybill", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update a specific airwaybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="airwaybillNumber"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID"),
     *          @OA\Property(type="integer", property="carrierID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the airwaybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("airwaybillstatus", name="updateStatusOfAirwaybill", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update a specific airwaybill status",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the airwaybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updateStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillStatusUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillService->updateStatus($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("airwaybills/{status}", name="getAirwaybillsByStatus", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\Parameter(
     *      name="status",
     *      in="path",
     *      required="true",
     *      description="the status of the airwaybill"
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the airwaybills",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
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
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="string", property="specificationName"),
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
    public function getAirwaybillsByStatus($status)
    {
        $result = $this->airwaybillService->getAirwaybillsByStatus($status);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("airwaybill/{id}", name="getAirwaybillByID", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\Parameter(
     *      name="id",
     *      in="path",
     *      required="true",
     *      description="the id of the airwaybill"
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the airwaybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
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
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="string", property="specificationName"),
     *                  @OA\Property(type="integer", property="freeWeight"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="boolean", property="isInOneHolder"),
     *                          @OA\Property(type="boolean", property="packed"),
     *                          @OA\Property(type="integer", property="travelID"),
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
     *                          @OA\Property(type="number", property="volume"),
     *                          @OA\Property(type="string", property="qrCode"),
     *                          @OA\Property(type="integer", property="guniQuantity"),
     *                          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                          @OA\Property(type="string", property="extraSpecification"),
     *                          @OA\Property(type="string", property="status"),
     *                          @OA\Property(type="text", property="externalWarehouseInfo"),
     *                          @OA\Property(type="boolean", property="isExternalWarehouse")
     *                      )
     *                  )
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function getAirwaybillById($id)
    {
        $result = $this->airwaybillService->getAirwaybillById($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filterairwaybills", name="filterAirwaybills", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="airwaybillNumber"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="integer", property="providedBy"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="consigneeID"),
     *          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="integer", property="clientUserID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the airwaybills",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="integer", property="clientUserID"),
     *                  @OA\Property(type="string", property="clientUserName"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="boolean", property="used"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="consigneeName"),
     *                  @OA\Property(type="string", property="shipperName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="string", property="specificationName"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items()
     *                  )
     *              )
     *          )
     *      )
     * )
     *
     */
    public function filterAirwaybills(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillService->filterAirwaybills($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("deleteallairwaybills", name="deleteAllAirwaybills", methods={"DELETE"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Airwaybill")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the number of the airwaybills being deleted",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                 @OA\Property(type="number", property="numbersOfItemDeleted")
     *                      )
     *                     )
     *          )
     * 
     * )
     * 
     * @Security(name="Bearer")
     */
    public function deleteAllAirwaybills()
    {
        $result = $this->airwaybillService->deleteAllAirwaybills();

        return $this->response($result, self::DELETE);
    }

    /**
     * @Route("airwaybill/{id}", name="deleteAirwaybill", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted air waybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="airwaybillNumber"),
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
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="string", property="specificationName"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items()
     *                  )
     *          )
     *      )
     * )
     */
    public function deleteAirWaybillById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->airwaybillService->deleteAirWaybillById($request);

        return $this->response($result, self::DELETE);
    }

}