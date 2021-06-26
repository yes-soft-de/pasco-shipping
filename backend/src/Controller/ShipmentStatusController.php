<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusUpdateRequest;
use App\Service\ShipmentStatusService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentStatusController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentStatusService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentStatusService $shipmentStatusService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentStatusService = $shipmentStatusService;
    }

    /**
     * @Route("shipmentstatus", name="createShipmentStatus", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Status")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new shipment status",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails"),
     *          @OA\Property(type="boolean", property="isInOneHolder"),
     *          @OA\Property(type="boolean", property="packed"),
     *          @OA\Property(type="string", property="holderType"),
     *          @OA\Property(type="integer", property="holderID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the shipment status",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="clientUserID"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="integer", property="distributorID"),
     *                  @OA\Property(type="integer", property="exportWarehouseID"),
     *                  @OA\Property(type="integer", property="importWarehouseID"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryID"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="integer", property="updatedBy"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     *
     * Note: We call this function exclusively when the part of the shipment inserted into
     * another container/airwaybill in different travel
     *
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentStatusCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentStatusService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("shipmentstatus", name="updateShipmentStatus", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Status")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update specific raw in Shipment Status table",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails"),
     *          @OA\Property(type="boolean", property="isInOneHolder"),
     *          @OA\Property(type="boolean", property="packed"),
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="integer", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="integer", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updateShipmentStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentStatusUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentStatusService->updateShipmentStatusByShipmentIdAndTrackNumber($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("unpackedshipments", name="getUnPackedShipments", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Status")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Return array of shipments which has not packed into container/airwaybill yet.",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="integer", property="exportWarehouseID"),
     *                  @OA\Property(type="integer", property="importWarehouseID"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getUnPackedShipments()
    {
        $result = $this->shipmentStatusService->getUnPackedShipments();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("myshipments", name="getShipmentsBySignedInUser", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Status")
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
     *      description="Return array of shipments for signed-in user",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser")
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function getMyShipments()
    {
        $result = $this->shipmentStatusService->getAcceptedShipmentsByUserID($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipments", name="getAllShipments", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Status")
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
     *      description="Return array of shipments",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser")
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function getAllShipments()
    {
        $result = $this->shipmentStatusService->getAllShipments();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("acceptedshipments/{transportationType}", name="getAcceptedShipmentsByTransportationType", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Status")
     * 
     * @OA\Parameter(
     *      name="transportationType",
     *      in="path",
     *      description="the type of the shipping",
     *      required=true
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent the info of the shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getShipmentsByTransportationType($transportationType)
    {
        $result = $this->shipmentStatusService->getShipmentsByTransportationType($transportationType);

        return $this->response($result, self::FETCH);
    }

}