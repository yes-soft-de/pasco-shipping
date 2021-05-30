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
            return null;
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
             * otherwise, we just continue 
             */

            if($request->getStatus() == "accepted")
            {
                $shipmentStatusRequest = $this->autoMapping->map(ShipmentOrderStatusUpdateRequest::class, ShipmentStatusCreateRequest::class, $request);

                $shipmentStatusRequest->setShipmentID($request->getId());
                $shipmentStatusRequest->setTrackNumber($this->getRandomCode());
                $shipmentStatusRequest->setShipmentStatus("accepted");
                $shipmentStatusRequest->setIsInOneHolder(false);
                $shipmentStatusRequest->setPacked(false);

                $shipmentStatusResult = $this->shipmentStatusManager->create($shipmentStatusRequest);

            }
            
            return $shipmentOrderEntity;
    
        }
    }

    public function getRandomCode()
    {
        // Get 5-digits random number

        $data = random_int(0, 9) . random_int(0, 9) . random_int(0, 9) . random_int(0, 9) . random_int(0, 9);

        return  vsprintf('%s%s%s%s%s', str_split(($data)));
    }
    
}