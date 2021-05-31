<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\OrderShipmentCreateRequest;
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
     *          @OA\Property(type="integer", property="supplierID"),
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
     *                  @OA\Property(type="integer", property="supplierID"),
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

        $request->setClientUserID($this->getUser()->getId());

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
     * @Route("shipmentsorders/{status}", name="getShipmentsOrdersByStatus", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Order")
     * 
     * @OA\Parameter(
     *      name="status",
     *      in="path",
     *      required="true",
     *      description="the status of the shipment order"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of object which each one represent the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
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
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="updatedBy"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getShipmentsOrdersByStatus($status)
    {
        $result = $this->shipmentOrderService->getShipmentsOrdersByStatus($status);

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
     *                  @OA\Property(type="string", property="QRcode"),
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

        $request->setUpdatedBy($this->getUser()->getId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentOrderService->updateShipmentOrderStatus($request);

        return $this->response($result, self::UPDATE);
    }

}