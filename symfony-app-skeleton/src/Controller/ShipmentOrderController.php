<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\OrderShipmentCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Service\ShipmentOrderService;
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
     * @Route("shipmentsorders/{status}", name="getShipmentsOrdersByStatus", methods={"GET"})
     * @return JsonResponse
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

}