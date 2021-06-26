<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Manager\ShipmentOrderManager;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\ShipmentLogCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Response\OrderShipmentByUserGetResponse;
use App\Response\OrderShipmentCreateResponse;
use App\Response\OrderShipmentGetResponse;
use App\Response\ShipmentsGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentOrderService
{
    private $autoMapping;
    private $shipmentOrderManager;
    private $params;
    private $shipmentLogService;

    public function __construct(AutoMapping $autoMapping, ShipmentOrderManager $shipmentOrderManager, ParameterBagInterface $params,
     ShipmentLogService $shipmentLogService)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentLogService = $shipmentLogService;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function createShipmentOrder(OrderShipmentCreateRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->createShipmentOrder($request);

        //Now, we insert a new log raw
        if($orderShipmentResult instanceof OrderShipmentEntity)
        {
            $shipmentLogRequest = new ShipmentLogCreateRequest();

            $shipmentLogRequest->setShipmentID($orderShipmentResult->getId());
            $shipmentLogRequest->setShipmentStatus($orderShipmentResult->getStatus());

            $this->shipmentLogService->create($shipmentLogRequest);
        }

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentCreateResponse::class, $orderShipmentResult);
    }

    public function getWaitingShipmentsOrders()
    {
        $ordersResponse = [];

        $orders = $this->shipmentOrderManager->getWaitingShipmentsOrders();
        
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

    public function updateShipmentOrder(OrderShipmentUpdateRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->updateShipmentOrder($request);

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentGetResponse::class, $orderShipmentResult);
    }

    public function updateShipmentOrderByClient(OrderShipmentUpdateByClientRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->updateShipmentOrderByClient($request);

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentGetResponse::class, $orderShipmentResult);
    }

    public function getWaitingShipmentsOrdersByTransportationType($transportationType)
    {
        $shipmentsResponse = [];

        $shipments = $this->shipmentOrderManager->getWaitingShipmentsOrdersByTransportationType($transportationType);
        
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

    public function getWaitingShipmentsOrderByUserID($userID)
    {
        $shipmentsOrdersResponse = [];

        $shipmentsOrders = $this->shipmentOrderManager->getWaitingShipmentsOrderByUserID($userID);

        foreach ($shipmentsOrders as $shipmentsOrder)
        {
            if($shipmentsOrder['image'])
            {
                $shipmentsOrder['image'] = $this->params . $shipmentsOrder['image'];
            }

            if($shipmentsOrder['clientUserImage'])
            {
                $shipmentsOrder['clientUserImage'] = $this->params . $shipmentsOrder['clientUserImage'];
            }

            if($shipmentsOrder['orderUpdatedByUserImage'])
            {
                $shipmentsOrder['orderUpdatedByUserImage'] = $this->params . $shipmentsOrder['orderUpdatedByUserImage'];
            }

            $shipmentsOrdersResponse[] = $this->autoMapping->map('array', OrderShipmentByUserGetResponse::class, $shipmentsOrder);
        }

        return $shipmentsOrdersResponse;
    }

    public function getShipmentOrderById($id)
    {
        $shipmentsOrdersResponse = [];

        $shipmentsOrders = $this->shipmentOrderManager->getShipmentOrderById($id);

        foreach ($shipmentsOrders as $shipmentsOrder)
        {
            if($shipmentsOrder['image'])
            {
                $shipmentsOrder['image'] = $this->params . $shipmentsOrder['image'];
            }

            if($shipmentsOrder['clientUserImage'])
            {
                $shipmentsOrder['clientUserImage'] = $this->params . $shipmentsOrder['clientUserImage'];
            }

            if($shipmentsOrder['orderUpdatedByUserImage'])
            {
                $shipmentsOrder['orderUpdatedByUserImage'] = $this->params . $shipmentsOrder['orderUpdatedByUserImage'];
            }

            $shipmentsOrdersResponse[] = $this->autoMapping->map('array', OrderShipmentGetResponse::class, $shipmentsOrder);
        }

        return $shipmentsOrdersResponse;
    }

    public function filterShipments($request)
    {
        $ordersResponse = [];

        $orders = $this->shipmentOrderManager->filterShipments($request);

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

}