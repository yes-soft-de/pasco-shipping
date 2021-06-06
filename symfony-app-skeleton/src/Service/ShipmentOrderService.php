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
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentOrderService
{
    private $autoMapping;
    private $shipmentOrderManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentOrderManager $shipmentOrderManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->params = $params->get('upload_base_url') . '/';
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
            if($order['image'])
            {
                $order['image'] = $this->params . $order['image'];
            }

            if($order['clientUserImage'])
            {
                $order['clientUserImage'] = $this->params . $order['clientUserImage'];
            }

            if($order['orderUpdatedByUserImage'])
            {
                $order['orderUpdatedByUserImage'] = $this->params . $order['orderUpdatedByUserImage'];
            }

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
            if($shipment['image'])
            {
                $shipment['image'] = $this->params . $shipment['image'];
            }

            if($shipment['clientUserImage'])
            {
                $shipment['clientUserImage'] = $this->params . $shipment['clientUserImage'];
            }

            if($shipment['orderUpdatedByUserImage'])
            {
                $shipment['orderUpdatedByUserImage'] = $this->params . $shipment['orderUpdatedByUserImage'];
            }

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentsGetResponse::class, $shipment);
        }

        return $shipmentsResponse;
    }

}