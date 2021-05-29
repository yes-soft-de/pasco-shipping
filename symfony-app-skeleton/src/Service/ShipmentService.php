<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Manager\ShipmentOrderManager;
use App\Manager\ShipmentStatusManager;
use App\Request\OrderShipmentCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Response\OrderShipmentCreateResponse;
use App\Response\OrderShipmentGetResponse;

class ShipmentService
{
    private $autoMapping;
    private $shipmentOrderManager;
    private $params;
    private $shipmentStatusManager;

    public function __construct(AutoMapping $autoMapping, ShipmentOrderManager $shipmentOrderManager, ShipmentStatusManager $shipmentStatusManager)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentStatusManager = $shipmentStatusManager;
    }

    public function createShipmentOrder(OrderShipmentCreateRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->createShipmentOrder($request);

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentCreateResponse::class, $orderShipmentResult);
    }

    public function getShipmentsOrdersByStatus($status)
    {
        $ordersResponse = [];

        $orders = $this->shipmentOrderManager->getShipmentsOrdersByStatus($status);
        
        foreach ($orders as $order)
        {
            $ordersResponse[] = $this->autoMapping->map('array', OrderShipmentGetResponse::class, $order);
        }

        return $ordersResponse;
    }

    public function updateShipmentOrderStatus(ShipmentOrderStatusUpdateRequest $request)
    {
        // First, we update the status of the shipment order

        $orderShipmentResult = $this->shipmentOrderManager->updateShipmentOrderStatus($request);

        /**
         * Second, we check the new status
         * if it is 'accepted' then we have to insert a new row with the shipmentID in the ShipmentStatusEntity
         * otherwise, we just continue 
         */

        if($request->getStatus() == "accepted")
        {
            $shipmentStatusRequest = $this->autoMapping->map(ShipmentOrderStatusUpdateRequest::class, ShipmentStatusCreateRequest::class, $request);

            $shipmentStatusRequest->setShipmentID($request->getId());

            $shipmentStatusRequest->setTrackNumber("xx1234");

            $shipmentStatusResult = $this->shipmentStatusManager->create($shipmentStatusRequest);

            return $shipmentStatusResult;
        }
        else
        {
            return $orderShipmentResult;
        }
    }

}