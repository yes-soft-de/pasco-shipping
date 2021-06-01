<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Manager\ShipmentOrderManager;
use App\Request\OrderShipmentCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Response\OrderShipmentCreateResponse;
use App\Response\OrderShipmentGetResponse;
use App\Response\ShipmentsGetResponse;

class ShipmentOrderService
{
    private $autoMapping;
    private $shipmentOrderManager;

    public function __construct(AutoMapping $autoMapping, ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentOrderManager = $shipmentOrderManager;
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
        $orderShipmentResult = $this->shipmentOrderManager->updateShipmentOrderStatus($request);

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentGetResponse::class, $orderShipmentResult);
    }

    public function getShipmentsByTransportationTypeAndStatus($transportationType, $status)
    {
        $shipmentsResponse = [];

        $shipments = $this->shipmentOrderManager->getShipmentsByTransportationTypeAndStatus($transportationType, $status);
        
        foreach ($shipments as $shipment)
        {
            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentsGetResponse::class, $shipment);
        }

        return $shipmentsResponse;
    }

}