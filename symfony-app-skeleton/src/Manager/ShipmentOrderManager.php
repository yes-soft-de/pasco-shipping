<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Repository\OrderShipmentEntityRepository;
use App\Request\OrderShipmentCreateRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentStatusCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentOrderManager
{
    const WAITING_SHIPMENT_STATUS = "waiting";
    const ACCEPTED_SHIPMENT_STATUS = "accepted";

    private $autoMapping;
    private $entityManager;
    private $orderShipmentEntityRepository;
    private $shipmentStatusManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderShipmentEntityRepository $orderShipmentEntityRepository,
     ShipmentStatusManager $shipmentStatusManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderShipmentEntityRepository = $orderShipmentEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
    }

    public function createShipmentOrder(OrderShipmentCreateRequest $request)
    {
        $orderShipmentEntity = $this->autoMapping->map(OrderShipmentCreateRequest::class, OrderShipmentEntity::class, $request);

        $orderShipmentEntity->setStatus($this::WAITING_SHIPMENT_STATUS);

        $this->entityManager->persist($orderShipmentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $orderShipmentEntity;
    }

    public function getShipmentsOrdersByStatus($status)
    {
        return $this->orderShipmentEntityRepository->getShipmentsOrdersByStatus($status);
    }

    public function updateShipmentOrderStatus(ShipmentOrderStatusUpdateRequest $request)
    {
        // First, we update the status of the order
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());
        
        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(ShipmentOrderStatusUpdateRequest::class, OrderShipmentEntity::class, 
            $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            /**
             * Second, we check the new status
             * if it is 'accepted' then we have to insert a new row with the shipmentID in the ShipmentStatusEntity
             * otherwise, we just continue without inserting a new row in the ShipmentStatusEntity
             */
            if($request->getStatus() == $this::ACCEPTED_SHIPMENT_STATUS)
            {
                $shipmentStatusRequest = new ShipmentStatusCreateRequest();

                $shipmentStatusRequest->setShipmentID($request->getId());
                $shipmentStatusRequest->setCreatedBy($request->getUpdatedBy());

                $shipmentStatusResult = $this->shipmentStatusManager->create($shipmentStatusRequest);
            }
            
            return $shipmentOrderEntity;
        }
    }

    public function getShipmentsByTransportationTypeAndStatus($transportationType, $status)
    {
        if($status == $this::WAITING_SHIPMENT_STATUS)
        {
            // get shipments from OrderShipmentEntity
            
            return $this->orderShipmentEntityRepository->getWitingShipmentsOrdersByTransportationType($transportationType);
        }
        elseif($status == $this::ACCEPTED_SHIPMENT_STATUS)
        {
            // get shipments from ShipmentStatusEntity

            return $this->shipmentStatusManager->getShipmentsByTransportationType($transportationType);
        }
    }
    
}