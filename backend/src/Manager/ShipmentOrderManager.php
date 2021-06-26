<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderShipmentEntity;
use App\Repository\OrderShipmentEntityRepository;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\ShipmentFilterRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentOrderManager
{
    const WAITING_SHIPMENT_STATUS = "waiting";
    const ACCEPTED_SHIPMENT_STATUS = "accepted";
    const REFUSED_SHIPMENT_STATUS = "refused";
    const MEASURED_SHIPMENT_STATUS = "measured";

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

    public function getWaitingShipmentsOrders()
    {
        return $this->orderShipmentEntityRepository->getShipmentsOrdersByStatus($this::WAITING_SHIPMENT_STATUS);
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

    public function updateShipmentOrder(OrderShipmentUpdateRequest $request)
    {
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(OrderShipmentUpdateRequest::class, OrderShipmentEntity::class,
                $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            /**
             * Shipment order update occurs when shipment is measured and pocketed,
             * as a result, we have to update the shipmentStatus in Shipment Status Entity
             */
            if($request->getShipmentStatus() == $this::MEASURED_SHIPMENT_STATUS)
            {
                $shipmentStatusRequest = $this->autoMapping->map(OrderShipmentUpdateRequest::class, ShipmentStatusUpdateRequest::class, $request);
                
                $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);
            }

            return $shipmentOrderEntity;
        }
    }

    public function updateShipmentOrderByClient(OrderShipmentUpdateByClientRequest $request)
    {
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(OrderShipmentUpdateByClientRequest::class, OrderShipmentEntity::class,
                $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentOrderEntity;
        }
    }

    public function getWaitingShipmentsOrdersByTransportationType($transportationType)
    {
          return $this->orderShipmentEntityRepository->getShipmentsOrdersByTransportationTypeAndStatus($transportationType, $this::WAITING_SHIPMENT_STATUS);
    }

    public function getWaitingShipmentsOrderByUserID($userID)
    {
        return $this->orderShipmentEntityRepository->getWaitingShipmentsOrderByUserID($userID);
    }

    public function getShipmentOrderById($id)
    {
        return $this->orderShipmentEntityRepository->getShipmentOrderById($id);
    }

    public function getCountOfShipmentsOrdersByStatus($status)
    {
        return count($this->orderShipmentEntityRepository->findBy(["status"=>$status]));
    }

    public function getCountOfAllShipmentsOrders()
    {
        return count($this->orderShipmentEntityRepository->findAll());
    }

    public function filterShipments(ShipmentFilterRequest $request)
    {
        $status = $request->getStatus();
        $paymentTime = $request->getPaymentTime();
        $transportationType = $request->getTransportationType();
        $createdAt = $request->getCreatedAt();
        $launchCountry = $request->getLaunchCountry();
        $targetCountry = $request->getTargetCountry();

        if($status != null && $paymentTime != null && $transportationType != null && $launchCountry == null && $targetCountry == null && $createdAt == null)
        {
            return $this->orderShipmentEntityRepository->filterShipmentsByStatusAndPaymentTimeAndTransportationType($status, $paymentTime, $transportationType);
        }
        elseif($status != null && $paymentTime != null && $transportationType != null && $launchCountry == null && $targetCountry == null && $createdAt != null)
        {
            return $this->orderShipmentEntityRepository->filterShipmentsByStatusAndPaymentTimeAndTransportationTypeAndCreationDate($status, $paymentTime, $transportationType, $createdAt);
        }
    }

    public function getShipmentOrderByMarkID($markID)
    {
        return $this->orderShipmentEntityRepository->getShipmentOrderByMarkID($markID);
    }
    
}