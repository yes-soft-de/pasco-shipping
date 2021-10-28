<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\OrderShipmentByDashboardCreateRequest;
use App\Request\OrderShipmentByDashboardUpdateRequest;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\ShipmentFilterRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentWaitingFilterRequest;
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
     *          @OA\Property(type="integer", property="exportWarehouseID"),
     *          @OA\Property(type="integer", property="quantity"),
     *          @OA\Property(type="array", property="images",
     *              @OA\Items()
     *          ),
     *          @OA\Property(type="integer", property="subProductCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="string", property="receiverName"),
     *          @OA\Property(type="string", property="receiverPhoneNumber"),
     *          @OA\Property(type="integer", property="receiverID"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification"),
     *          @OA\Property(type="string", property="holderType", description="public or private container"),
     *          @OA\Property(type="text", property="externalWarehouseInfo"),
     *          @OA\Property(type="string", property="exportCountryID"),
     *          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *          @OA\Property(type="array", property="requestedHolders",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="integer", property="carrierID"),
     *                  @OA\Property(type="integer", property="portID"),
     *                  @OA\Property(type="string", property="notes")
     *              )
     *          ),
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
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="holderType", description="public or private container")
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
     * @Route("ordershipmentbydashboard", name="createShipmentOrderByDashboard", methods={"POST"})
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
     *          @OA\Property(type="string", property="clientUserID"),
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="string", property="target"),
     *          @OA\Property(type="string", property="supplierName"),
     *          @OA\Property(type="integer", property="distributorID"),
     *          @OA\Property(type="string", property="exportWarehouseID"),
     *          @OA\Property(type="string", property="exportCountryID"),
     *          @OA\Property(type="string", property="quantity"),
     *          @OA\Property(type="array", property="images",
     *              @OA\Items()
     *          ),
     *          @OA\Property(type="string", property="subProductCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="string", property="receiverName"),
     *          @OA\Property(type="string", property="receiverPhoneNumber"),
     *          @OA\Property(type="integer", property="receiverID"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification"),
     *          @OA\Property(type="string", property="holderType", description="lcl or fcl"),
     *          @OA\Property(type="text", property="externalWarehouseInfo"),
     *          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *          @OA\Property(type="array", property="requestedHolders",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="integer", property="carrierID"),
     *                  @OA\Property(type="integer", property="portID"),
     *                  @OA\Property(type="integer", property="exportPortID"),
     *                  @OA\Property(type="string", property="notes")
     *              )
     *          )
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
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="holderType", description="public or private container")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function createShipmentOrderByDashboard(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderShipmentByDashboardCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->createShipmentOrderByDashboard($request);

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
     *                  @OA\Property(type="string", property="subProductCategoryName"),
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
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
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
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
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
     *          @OA\Property(type="string", property="packetingBy"),
     *          @OA\Property(type="string", property="weight"),
     *          @OA\Property(type="float", property="volume"),
     *          @OA\Property(type="string", property="qrCode"),
     *          @OA\Property(type="string", property="guniQuantity"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails")
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
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
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
     *          @OA\Property(type="integer", property="receiverID"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification"),
     *          @OA\Property(type="string", property="holderType", description="public or private container"),
     *          @OA\Property(type="text", property="externalWarehouseInfo"),
     *          @OA\Property(type="boolean", property="isExternalWarehouse")
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
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
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
     * @Route("shipmentorderbydashboard", name="updateShipmentOrderByDashboard", methods={"PUT"})
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
     *          @OA\Property(type="string", property="importWarehouseID"),
     *          @OA\Property(type="integer", property="distributorID"),
     *          @OA\Property(type="integer", property="subProductCategoryID"),
     *          @OA\Property(type="string", property="unit"),
     *          @OA\Property(type="integer", property="markID"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *          @OA\Property(type="string", property="extraSpecification"),
     *          @OA\Property(type="integer", property="receiverID"),
     *          @OA\Property(type="array", property="images",
     *              @OA\Items()
     *          ),
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
     *                  @OA\Property(type="string", property="markNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="integer", property="guniQuantity"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updateShipmentOrderByDashboard(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderShipmentByDashboardUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->updateShipmentOrderByDashboard($request);

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
     *                  @OA\Property(type="string", property="subProductCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="string", property="markNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="integer", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
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
     *                  @OA\Property(type="string", property="holderType"),
     *                  @OA\Property(type="integer", property="holderCount"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="array", property="images",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="string", property="image"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="boolean", property="specialLink"),
     *                      )
     *                  ),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="subProductCategoryName"),
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
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage"),
     *                  @OA\Property(type="array", property="pendingHolders",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="integer", property="specificationID"),
     *                          @OA\Property(type="string", property="notes"),
     *                          @OA\Property(type="string", property="portName"),
     *                          @OA\Property(type="string", property="exportPortName"),
     *                          @OA\Property(type="string", property="carrierName"),
     *                          @OA\Property(type="string", property="location"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="string", property="specificationName")
     *                      ),
     *                  )
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
     *                  @OA\Property(type="array", property="images",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="string", property="image"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="boolean", property="specialLink"),
     *                      )
     *                  ),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="subProductCategoryName"),
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
     *                  @OA\Property(type="string", property="holderType"),
     *                  @OA\Property(type="array", property="gunny",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="gunnyID"),
     *                          @OA\Property(type="string", property="gunnyIdentificationNumber"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="string", property="createdByUser"),
     *                          @OA\Property(type="string", property="createdByUserImage"),
     *                          @OA\Property(type="string", property="updatedByUser"),
     *                          @OA\Property(type="string", property="updatedByUserImage")
     *                     )
     *                  ),
     *                  @OA\Property(type="array", property="tracks", 
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="string", property="shipmentStatus"),
     *                          @OA\Property(type="string", property="statusDetails"),
     *                          @OA\Property(type="boolean", property="isInOneHolder"),
     *                          @OA\Property(type="boolean", property="packed"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="object", property="createdBy"),
     *                          @OA\Property(type="object", property="updatedBy"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="integer", property="holderID"),
     *                          @OA\Property(type="integer", property="travelID"),
     *                          @OA\Property(type="boolean", property="hasShiftingOrder"),
     *                          @OA\Property(type="text", property="shiftingOrderStatus"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage"),
     *                          @OA\Property(type="array", property="holders",
     *                              @OA\Items(
     *                                  @OA\Property(type="integer", property="id"),
     *                                  @OA\Property(type="integer", property="shippingStatus"),
     *                                  @OA\Property(type="integer", property="specificationID"),
     *                                  @OA\Property(type="string", property="notes"),
     *                                  @OA\Property(type="string", property="portName"),
     *                                  @OA\Property(type="string", property="carrierName"),
     *                                  @OA\Property(type="string", property="location"),
     *                                  @OA\Property(type="object", property="createdAt"),
     *                                  @OA\Property(type="string", property="specificationName")
     *                              )
     *                          ),
     *                      )
     *                  ),
     *                  @OA\Property(type="object", property="receivingInfo",
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="integer", property="receivedQuantity"),
     *                          @OA\Property(type="integer", property="supplierID"),
     *                          @OA\Property(type="string", property="notes"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="string", property="supplierName"),
     *                  ),
     *                  @OA\Property(type="integer", property="remainedQuantity"),
     *                  @OA\Property(type="array", property="pendingHolders",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="integer", property="specificationID"),
     *                          @OA\Property(type="string", property="notes"),
     *                          @OA\Property(type="string", property="portName"),
     *                          @OA\Property(type="string", property="exportPortName"),
     *                          @OA\Property(type="string", property="carrierName"),
     *                          @OA\Property(type="string", property="location"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="string", property="specificationName")
     *                      )
     *                   ),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="integer", property="shipmentInvoiceID"),
     *                  @OA\Property(type="integer", property="clientUserID"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
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
     * @Route("acceptedshipmentsorders", name="getAllAcceptedShipmentsOrders", methods={"GET"})
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
     *                  @OA\Property(type="string", property="supplierName"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
     *                  @OA\Property(type="number", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="subProductCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="string", property="markNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="number", property="volume"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="number", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="array", property="tracks", 
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="string", property="shipmentStatus"),
     *                          @OA\Property(type="string", property="statusDetails"),
     *                          @OA\Property(type="boolean", property="isInOneHolder"),
     *                          @OA\Property(type="boolean", property="packed"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="object", property="createdBy"),
     *                          @OA\Property(type="object", property="updatedBy"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="integer", property="holderID"),
     *                          @OA\Property(type="integer", property="travelID"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage")
     *                      )
     *                  ),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
     *                  @OA\Property(type="string", property="orderUpdatedByUser"),
     *                  @OA\Property(type="string", property="orderUpdatedByUserImage")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAcceptedShipmentsOrders()
    {
        $result = $this->shipmentOrderService->getAcceptedShipmentsOrders();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filterwaitingshipments", name="filterWaitingShipments", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Order")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="integer", property="exportWarehouseID"),
     *          @OA\Property(type="string", property="paymentTime")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get the whole info of waiting shipment orders being filtered",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="totalCount"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="string", property="transportationType"),
     *                          @OA\Property(type="string", property="target"),
     *                          @OA\Property(type="string", property="supplierName"),
     *                          @OA\Property(type="string", property="distributorName"),
     *                          @OA\Property(type="string", property="exportWarehouseName"),
     *                          @OA\Property(type="string", property="importWarehouseName"),
     *                          @OA\Property(type="number", property="quantity"),
     *                          @OA\Property(type="string", property="image"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="string", property="productCategoryName"),
     *                          @OA\Property(type="string", property="subProductCategoryName"),
     *                          @OA\Property(type="string", property="unit"),
     *                          @OA\Property(type="string", property="receiverName"),
     *                          @OA\Property(type="string", property="receiverPhoneNumber"),
     *                          @OA\Property(type="string", property="packetingBy"),
     *                          @OA\Property(type="string", property="markNumber"),
     *                          @OA\Property(type="string", property="paymentTime"),
     *                          @OA\Property(type="number", property="weight"),
     *                          @OA\Property(type="number", property="volume"),
     *                          @OA\Property(type="string", property="qrCode"),
     *                          @OA\Property(type="number", property="guniQuantity"),
     *                          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                          @OA\Property(type="string", property="extraSpecification"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="string", property="holderCount"),
     *                          @OA\Property(type="string", property="status"),
     *                          @OA\Property(type="array", property="tracks", 
     *                              @OA\Items()
     *                          ),
     *                          @OA\Property(type="array", property="pendingHolders",
     *                              @OA\Items(
     *                                  @OA\Property(type="integer", property="id"),
     *                                  @OA\Property(type="integer", property="shipmentID"),
     *                                  @OA\Property(type="integer", property="specificationID"),
     *                                  @OA\Property(type="string", property="notes"),
     *                                  @OA\Property(type="string", property="portName"),
     *                                  @OA\Property(type="string", property="exportPortName"),
     *                                  @OA\Property(type="string", property="carrierName"),
     *                                  @OA\Property(type="string", property="location"),
     *                                  @OA\Property(type="object", property="createdAt"),
     *                                  @OA\Property(type="string", property="specificationName")
     *                              )
     *                          ),
     *                          @OA\Property(type="text", property="externalWarehouseInfo"),
     *                          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                          @OA\Property(type="string", property="clientUsername"),
     *                          @OA\Property(type="string", property="clientUserImage"),
     *                          @OA\Property(type="string", property="clientIdentificationNumber"),
     *                          @OA\Property(type="string", property="orderUpdatedByUser"),
     *                          @OA\Property(type="string", property="orderUpdatedByUserImage")
     *                      )
     *                  )
     *              )
     *          )
     *      )
     * )
     *
     */
    public function filterWaitingShipmentsOrders(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentWaitingFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->filterWaitingShipmentsOrders($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filteracceptedshipments", name="filterAcceptedShipments", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Main")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="transportationType"),
     *          @OA\Property(type="string", property="paymentTime"),
     *          @OA\Property(type="string", property="launchCountry"),
     *          @OA\Property(type="string", property="targetCountry"),
     *          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *          @OA\Property(type="integer", property="exportWarehouseID"),
     *          @OA\Property(type="integer", property="importWarehouseID"),
     *          @OA\Property(type="string", property="dateOne"),
     *          @OA\Property(type="string", property="dateTwo"),
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="airWaybillNumber"),
     *          @OA\Property(type="integer", property="clientUserID"),
     *          @OA\Property(type="boolean", property="measuredUntilCleared"),
     *          @OA\Property(type="boolean", property="measuredUntilArrived"),
     *          @OA\Property(type="boolean", property="acceptedUntilCleared"),
     *          @OA\Property(type="boolean", property="acceptedUntilArrived")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get the whole info of the shipment orders being filtered",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="statistics",
     *                      @OA\Property(type="integer", property="received"),
     *                      @OA\Property(type="integer", property="notDelivered"),
     *                      @OA\Property(type="integer", property="delivered")
     *                  ),
     *                  @OA\Property(type="integer", property="totalCount"),
     *                  @OA\Property(type="integer", property="totalVolume"),
     *                  @OA\Property(type="integer", property="totalWeight"),
     *                  @OA\Property(type="integer", property="totalGunny"),
     *                  @OA\Property(type="integer", property="totalReceivedQuantity"),
     *                  @OA\Property(type="array", property="shipments",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="string", property="transportationType"),
     *                          @OA\Property(type="string", property="target"),
     *                          @OA\Property(type="integer", property="supplierName"),
     *                          @OA\Property(type="integer", property="distributorID"),
     *                          @OA\Property(type="string", property="exportWarehouseCity"),
     *                          @OA\Property(type="string", property="importWarehouseCity"),
     *                          @OA\Property(type="string", property="quantity"),
     *                          @OA\Property(type="string", property="image"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="string", property="productCategoryName"),
     *                          @OA\Property(type="string", property="subProductCategoryID"),
     *                          @OA\Property(type="string", property="subProductCategoryName"),
     *                          @OA\Property(type="string", property="categoriesNames"),
     *                          @OA\Property(type="string", property="unit"),
     *                          @OA\Property(type="string", property="receiverID"),
     *                          @OA\Property(type="string", property="receiverName"),
     *                          @OA\Property(type="string", property="receiverPhoneNumber"),
     *                          @OA\Property(type="string", property="packetingBy"),
     *                          @OA\Property(type="string", property="markID"),
     *                          @OA\Property(type="string", property="markNumber"),
     *                          @OA\Property(type="string", property="paymentTime"),
     *                          @OA\Property(type="number", property="weight"),
     *                          @OA\Property(type="number", property="volume"),
     *                          @OA\Property(type="string", property="qrCode"),
     *                          @OA\Property(type="string", property="guniQuantity"),
     *                          @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                          @OA\Property(type="string", property="extraSpecification"),
     *                          @OA\Property(type="string", property="status"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="string", property="holderCount"),
     *                          @OA\Property(type="array", property="shipmentStatusInfo", 
     *                              @OA\Items(
     *                                  @OA\Property(type="integer", property="id"),
     *                                  @OA\Property(type="integer", property="shipmentID"),
     *                                  @OA\Property(type="string", property="trackNumber"),
     *                                  @OA\Property(type="string", property="shipmentStatus"),
     *                                  @OA\Property(type="string", property="statusDetails"),
     *                                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                                  @OA\Property(type="boolean", property="packed"),
     *                                  @OA\Property(type="object", property="createdAt"),
     *                                  @OA\Property(type="object", property="updatedAt"),
     *                                  @OA\Property(type="object", property="createdBy"),
     *                                  @OA\Property(type="object", property="updatedBy"),
     *                                  @OA\Property(type="string", property="holderType"),
     *                                  @OA\Property(type="integer", property="holderID"),
     *                                  @OA\Property(type="integer", property="travelID"),
     *                                  @OA\Property(type="boolean", property="hasShiftingOrder"),
     *                                  @OA\Property(type="text", property="shiftingOrderStatus"),
     *                                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                                  @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                                  @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage")
     *                              )
     *                          ),
     *                          @OA\Property(type="text", property="externalWarehouseInfo"),
     *                          @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                          @OA\Property(type="string", property="clientUserID"),
     *                          @OA\Property(type="string", property="clientUsername"),
     *                          @OA\Property(type="string", property="clientUserImage"),
     *                          @OA\Property(type="string", property="clientIdentificationNumber"),
     *                          @OA\Property(type="string", property="orderUpdatedByUser"),
     *                          @OA\Property(type="string", property="orderUpdatedByUserImage")
     *                      )
     *                  )
     *              )
     *          )
     *      )
     * )
     *
     */
    public function filterAcceptedShipments(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->filterAcceptedShipments($request);

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
     *                  @OA\Property(type="string", property="subProductCategoryName"),
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
     *                  @OA\Property(type="array", property="tracks", 
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="string", property="shipmentStatus"),
     *                          @OA\Property(type="string", property="statusDetails"),
     *                          @OA\Property(type="boolean", property="isInOneHolder"),
     *                          @OA\Property(type="boolean", property="packed"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="object", property="createdBy"),
     *                          @OA\Property(type="object", property="updatedBy"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="integer", property="holderID"),
     *                          @OA\Property(type="integer", property="travelID"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                          @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage")
     *                      )
     *                  ),
     *                  @OA\Property(type="text", property="externalWarehouseInfo"),
     *                  @OA\Property(type="boolean", property="isExternalWarehouse"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
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