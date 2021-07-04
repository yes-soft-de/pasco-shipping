<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Service\ShipmentOrderService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentOrderController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentOrderService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentOrderService $shipmentOrderService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentOrderService = $shipmentOrderService;
    }

    /**
     * @Route("ordershipment", name="createShipmentOrder", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="string", property="target"),
     *          @OA\Property(type="string", property="supplierName"),
     *          @OA\Property(type="integer", property="distributorID"),
     *          @OA\Property(type="string", property="exportWarehouseID"),
     *          @OA\Property(type="string", property="quantity"),
     *          @OA\Property(type="string", property="image"),
     *          @OA\Property(type="string", property="productCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="string", property="receiverName"),
     *          @OA\Property(type="string", property="receiverPhoneNumber"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
     *                  @OA\Property(type="integer", property="distributorID"),
     *                  @OA\Property(type="string", property="exportWarehouseID"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="productCategoryID"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function createShipmentOrder(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderShipmentCreateRequest::class, (object)$data);

        $request->setClientUserID($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->createShipmentOrder($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("waitingshipmentsorders", name="getWaitingShipmentsOrders", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Order")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
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
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getWaitingShipmentsOrders()
    {
        $result = $this->shipmentOrderService->getWaitingShipmentsOrders();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipmentorderstatus", name="updateShipmentOrderStatus", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Order")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Update the status of an order",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="status"),
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
     *                  @OA\Property(type="integer", property="clientUserID"),
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
     *                  @OA\Property(type="integer", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="updatedBy"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function updateShipmentOrderStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentOrderStatusUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->updateShipmentOrderStatus($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("shipmentorder", name="updateShipmentOrder", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update the order of a shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="string", property="target"),
     *          @OA\Property(type="string", property="supplierName"),
     *          @OA\Property(type="integer", property="distributorID"),
     *          @OA\Property(type="integer", property="quantity"),
     *          @OA\Property(type="string", property="image"),
     *          @OA\Property(type="integer", property="productCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="string", property="receiverName"),
     *          @OA\Property(type="string", property="receiverPhoneNumber"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification"),
     *          @OA\Property(type="string", property="exportWarehouseID"),
     *          @OA\Property(type="string", property="importWarehouseID"),
     *          @OA\Property(type="string", property="packetingBy"),
     *          @OA\Property(type="string", property="weight"),
     *          @OA\Property(type="string", property="qrCode"),
     *          @OA\Property(type="string", property="guniQuantity"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails"),
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
     *                  @OA\Property(type="integer", property="clientUsername"),
     *                  @OA\Property(type="integer", property="clientUserImage"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="string", property="supplierName"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
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
     *                  @OA\Property(type="integer", property="guniQuantity"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updateShipmentOrder(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderShipmentUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->updateShipmentOrder($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("myshipmentorder", name="updateShipmentOrderByClient", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update the order of a shipment by the client",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="string", property="target"),
     *          @OA\Property(type="integer", property="supplierID"),
     *          @OA\Property(type="integer", property="supplierName"),
     *          @OA\Property(type="string", property="exportWarehouseID"),
     *          @OA\Property(type="string", property="quantity"),
     *          @OA\Property(type="string", property="image"),
     *          @OA\Property(type="string", property="productCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="string", property="receiverName"),
     *          @OA\Property(type="string", property="receiverPhoneNumber"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification")
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
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
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
     *                  @OA\Property(type="integer", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
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
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updateShipmentOrderByClient(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderShipmentUpdateByClientRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->updateShipmentOrderByClient($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("waitingshipmentsorders/{transportationType}", name="getWaitingShipmentsOrdersByTransportationType", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Order")
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
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="string", property="supplierName"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
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
     *                  @OA\Property(type="integer", property="guniQuantity"),
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
    public function getWaitingShipmentsOrdersByTransportationType($transportationType)
    {
        $result = $this->shipmentOrderService->getWaitingShipmentsOrdersByTransportationType($transportationType);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("mywaitingshipmentsorders", name="getWaitingShipmentsOrdersBySignedInUser", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
     *                  @OA\Property(type="integer", property="distributorID"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryID"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="string", property="markNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getMyWaitingShipmentsOrderByUserID()
    {
        $result = $this->shipmentOrderService->getWaitingShipmentsOrderByUserID($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipmentorder/{id}", name="getShipmentOrderById", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\Parameter(
     *      name="id",
     *      in="path",
     *      description="the id of the order",
     *      required=true
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
     *                  @OA\Property(type="integer", property="distributorID"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
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
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getShipmentOrderById($id)
    {
        $result = $this->shipmentOrderService->getShipmentOrderById($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipmentorder/{id}", name="deleteShipmnetOrder", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted Shipment Order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierName"),
     *                  @OA\Property(type="integer", property="distributorID"),
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
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function deleteShipmentOrder(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->shipmentOrderService->deleteShipmentOrder($request);

        return $this->response($result, self::DELETE);
    }

}