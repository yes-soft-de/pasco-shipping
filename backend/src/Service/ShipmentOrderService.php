<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Manager\ShipmentOrderManager;
use App\Request\OrderShipmentByDashboardCreateRequest;
use App\Request\OrderShipmentByDashboardUpdateRequest;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\ShipmentFilterRequest;
use App\Request\ShipmentLogCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentWaitingFilterRequest;
use App\Response\OrderShipmentByUserGetResponse;
use App\Response\OrderShipmentCreateResponse;
use App\Response\OrderShipmentGetResponse;
use App\Response\ShipmentFilterResponse;
use App\Response\ShipmentsGetResponse;
use App\Response\WaitingShipmentFilterResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentOrderService
{
    private $autoMapping;
    private $shipmentOrderManager;
    private $params;
    private $shipmentLogService;
    private $shipmentStatusService;
    private $gunnyShipmentService;
    private $shipmentInvoiceService;

    public function __construct(AutoMapping $autoMapping, ShipmentOrderManager $shipmentOrderManager, ParameterBagInterface $params, ShipmentLogService $shipmentLogService,
                                GunnyShipmentService $gunnyShipmentService, ShipmentStatusService $shipmentStatusService, ShipmentInvoiceService $shipmentInvoiceService)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentLogService = $shipmentLogService;
        $this->shipmentStatusService = $shipmentStatusService;
        $this->gunnyShipmentService = $gunnyShipmentService;
        $this->shipmentInvoiceService = $shipmentInvoiceService;

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
            $shipmentLogRequest->setCreatedBy($request->getClientUserID());

            $this->shipmentLogService->create($shipmentLogRequest);
        }

        return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentCreateResponse::class, $orderShipmentResult);
    }

    public function createShipmentOrderByDashboard(OrderShipmentByDashboardCreateRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->createShipmentOrderByDashboard($request);

        //Now, we insert a new log raw
        if($orderShipmentResult instanceof OrderShipmentEntity)
        {
            $shipmentLogRequest = new ShipmentLogCreateRequest();

            $shipmentLogRequest->setShipmentID($orderShipmentResult->getId());
            $shipmentLogRequest->setShipmentStatus($orderShipmentResult->getStatus());
            $shipmentLogRequest->setCreatedBy($request->getCreatedBy());

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

    public function getAcceptedShipmentsOrders()
    {
        $ordersResponse = [];

        $orders = $this->shipmentOrderManager->getAcceptedShipmentsOrders();
        
        foreach ($orders as $order)
        {
            $order['tracks'] = $this->shipmentOrderManager->getShipmentStatusAndTracksByShipmentID($order['id']);

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

    // Used when shipment is measured
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

    public function updateShipmentOrderByDashboard(OrderShipmentByDashboardUpdateRequest $request)
    {
        $orderShipmentResult = $this->shipmentOrderManager->updateShipmentOrderByDashboard($request);

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
            $shipmentsOrder['pendingHolders'] = $this->shipmentOrderManager->getPendingHoldersByShipmentIdAndShippingType($shipmentsOrder['id'], $shipmentsOrder['transportationType']);

            $shipmentsOrder['images'] = $this->shipmentOrderManager->getImagesByShipmentID($shipmentsOrder['id']);

            if($shipmentsOrder['images'])
            {
                foreach($shipmentsOrder['images'] as $key=>$val)
                {
                    $shipmentsOrder['images'][$key]['image'] = $this->params . $val['image'];
                }
            }

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
        $shipmentOrder = $this->shipmentOrderManager->getShipmentOrderById($id);

        if(!empty($shipmentOrder['tracks']))
        {
            foreach($shipmentOrder['tracks'] as $key => $val)
            {
                // Get gunny for each (shipmentID + trackNumber)
                $shipmentOrder['gunny'] = $this->gunnyShipmentService->getGunnyByShipmentIdAndTrackNumber($id, $val['trackNumber']);

                // Get holders status that the shipment stored in
                $shipmentOrder['tracks'][$key]['holders'] = $this->shipmentStatusService->getHoldersOfShipmentByTrackNumber($val['trackNumber']);
            }
        }

        if($shipmentOrder)
        {
            $shipmentOrder['pendingHolders'] = $this->shipmentOrderManager->getPendingHoldersByShipmentIdAndShippingType($id, $shipmentOrder['transportationType']);
        }

        if($shipmentOrder['images'])
        {
            foreach($shipmentOrder['images'] as $key=>$val)
            {
                $shipmentOrder['images'][$key]['image'] = $this->params . $shipmentOrder['images'][$key]['image'];
            }
        }

        if($shipmentOrder['clientUserImage'])
        {
            $shipmentOrder['clientUserImage'] = $this->params . $shipmentOrder['clientUserImage'];
        }

        if($shipmentOrder['orderUpdatedByUserImage'])
        {
            $shipmentOrder['orderUpdatedByUserImage'] = $this->params . $shipmentOrder['orderUpdatedByUserImage'];
        }

        // Get shipment invoice id
        $invoiceID = $this->shipmentInvoiceService->getShipmentInvoiceIdByShipmentID($id);

        if($invoiceID)
        {
            $shipmentOrder['shipmentInvoiceID'] = $invoiceID->id;
        }

        return $this->autoMapping->map('array', OrderShipmentGetResponse::class, $shipmentOrder);
    }

    public function filterWaitingShipmentsOrders(ShipmentWaitingFilterRequest $request)
    {
        $ordersResponse = [];

        $orders = $this->shipmentOrderManager->filterWaitingShipmentsOrders($request);
        
        if($orders)
        {
            $ordersResponse['totalCount'] = count($orders);
            
            foreach ($orders as $order)
            {
                $order['pendingHolders'] = $this->shipmentOrderManager->getPendingHoldersByShipmentIdAndShippingType($order['id'], $order['transportationType']);

                if($order['images'])
                {
                    foreach ($order['images'] as $key=>$val)
                    {
                        $order['images'][$key]['image'] = $this->params . $val['image'];
                    }
                }
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
                
                $ordersResponse['shipments'][] = $this->autoMapping->map('array', WaitingShipmentFilterResponse::class, $order);
            }
        }

        return $ordersResponse;
    }

    public function filterAcceptedShipments(ShipmentFilterRequest $request)
    {
        $orders = $this->shipmentOrderManager->filterAcceptedShipments($request);

        if($orders)
        {
            foreach ($orders['shipments'] as $order)
            {
                if($order['clientUserImage'])
                {
                    $order['clientUserImage'] = $this->params . $order['clientUserImage'];
                }

                if($order['orderUpdatedByUserImage'])
                {
                    $order['orderUpdatedByUserImage'] = $this->params . $order['orderUpdatedByUserImage'];
                }
            }
        }

        return $this->autoMapping->map('array', ShipmentFilterResponse::class, $orders);
    }

    public function getImportWarehouseIdByShipmentOrderID($shipmentID)
    {
        return $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($shipmentID);
    }

    public function deleteShipmentOrder($request)
    {
        $result = $this->shipmentOrderManager->deleteShipmentOrder($request);

        if($result instanceof  OrderShipmentEntity)
        {
            return $this->autoMapping->map(OrderShipmentEntity::class, OrderShipmentGetResponse::class, $result);
        }

        return $result;
    }

}