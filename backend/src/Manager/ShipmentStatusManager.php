<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Constant\ShipmentStatusConstant;
use App\Entity\ShipmentStatusEntity;
use App\Repository\ShipmentStatusEntityRepository;
use App\Request\ShipmentLogCreateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusOfHolderUpdateRequest;
use App\Request\ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentStatusManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentLogManager;
    private $containerManager;
    private $airwaybillManager;
    private $shipmentStatusEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentStatusEntityRepository $shipmentStatusEntityRepository,
     ShipmentLogManager $shipmentLogManager, ContainerManager $containerManager, AirwaybillManager $airwaybillManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentLogManager = $shipmentLogManager;
        $this->shipmentStatusEntityRepository = $shipmentStatusEntityRepository;
        $this->containerManager = $containerManager;
        $this->airwaybillManager = $airwaybillManager;
    }

    // Create newly accepted shipment raw in ShipmentStatusEntity
    public function create(ShipmentStatusCreateRequest $request)
    {
        $shipmentStatusEntity = $this->autoMapping->map(ShipmentStatusCreateRequest::class, ShipmentStatusEntity::class, $request);
        
        $shipmentStatusEntity->setTrackNumber($this->getRandomCode());
        $shipmentStatusEntity->setShipmentStatus(ShipmentStatusConstant::$ACCEPTED_SHIPMENT_STATUS);
        
        $this->entityManager->persist($shipmentStatusEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        //Now, we insert a new log raw
        $shipmentLogRequest = new ShipmentLogCreateRequest();

        $shipmentLogRequest->setShipmentID($shipmentStatusEntity->getShipmentID());
        $shipmentLogRequest->setShipmentStatus($shipmentStatusEntity->getShipmentStatus());
        $shipmentLogRequest->setTrackNumber($shipmentStatusEntity->getTrackNumber());
        $shipmentLogRequest->setCreatedBy($shipmentStatusEntity->getCreatedBy());

        $this->shipmentLogManager->create($shipmentLogRequest);

        return $shipmentStatusEntity;
    }

    /**
     * Create new track number for existing shipment
     * ex. when part of the shipment goes on different travel
     */
    public function createNewShipmentInfo(ShipmentStatusCreateRequest $request)
    {
        $newTrackNumber = $this->getRandomCode();

        // Update statusDetails + shipmentStatus of the shipment for the first track number in the ShipmentStatus entity
        $shipmentStatusRequest = $this->autoMapping->map(ShipmentStatusCreateRequest::class, ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, $request);
        
        $shipmentStatusRequest->setStatusDetails("You can track the other shipment's part via the track number: " . $newTrackNumber);
        $shipmentStatusRequest->setUpdatedBy($request->getCreatedBy());
        
        $this->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);

        // Next insert new record for the same shipment but with new track number
        $shipmentStatusEntity = $this->autoMapping->map(ShipmentStatusCreateRequest::class, ShipmentStatusEntity::class, $request);

        $shipmentStatusEntity->setTrackNumber($newTrackNumber);
        $shipmentStatusRequest->setStatusDetails("You can track the other shipment's part via the track number: " . $request->getTrackNumber());
        
        $this->entityManager->persist($shipmentStatusEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        //Now, we insert logs raws with the new track number
        $shipmentLogRequest = $this->autoMapping->map(ShipmentStatusCreateRequest::class, ShipmentLogCreateRequest::class, $request);

        $shipmentLogRequest->setTrackNumber($shipmentStatusEntity->getTrackNumber());

        $this->shipmentLogManager->createShipmentLogsUntillSpecificStatus($shipmentLogRequest);

        return $shipmentStatusEntity;
    }

    public function updateShipmentStatusOfSpecificHolder(ShipmentStatusOfHolderUpdateRequest $request)
    {
        $shipmentStatusEntity = $this->shipmentStatusEntityRepository->getByShipmentIdAndTrackNumber($request->getShipmentID(), $request->getTrackNumber());
        
        if(!$shipmentStatusEntity)
        {
            return $shipmentStatusEntity;
        }
        else
        {
            $shipmentStatusEntity = $this->autoMapping->mapToObject(ShipmentStatusOfHolderUpdateRequest::class, ShipmentStatusEntity::class, 
            $request, $shipmentStatusEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            //Now, we insert a new log raw
            $shipmentLogRequest = new ShipmentLogCreateRequest();

            $shipmentLogRequest->setShipmentID($shipmentStatusEntity->getShipmentID());
            $shipmentLogRequest->setShipmentStatus($shipmentStatusEntity->getShipmentStatus());
            $shipmentLogRequest->setTrackNumber($shipmentStatusEntity->getTrackNumber());
            $shipmentLogRequest->setCreatedBy($shipmentStatusEntity->getCreatedBy());

            $this->shipmentLogManager->create($shipmentLogRequest);
        }
    }

    public function updateShipmentStatusByShipmentIdAndTrackNumber(ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest $request)
    {
        $shipmentStatusEntity = $this->shipmentStatusEntityRepository->getByShipmentIdAndTrackNumber($request->getShipmentID(), $request->getTrackNumber());
        
        if(!$shipmentStatusEntity)
        {
            return $shipmentStatusEntity;
        }
        else
        {
            $shipmentStatusEntity = $this->autoMapping->mapToObject(ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, ShipmentStatusEntity::class, 
            $request, $shipmentStatusEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            //Now, we insert a new log raw
            $shipmentLogRequest = $this->autoMapping->map(ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, ShipmentLogCreateRequest::class, $request);

            $shipmentLogRequest->setCreatedBy($shipmentStatusEntity->getUpdatedBy());

            $this->shipmentLogManager->create($shipmentLogRequest);

            return $shipmentStatusEntity;
        }
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        return $this->shipmentStatusEntityRepository->getShipmentsByTransportationType($transportationType);
    }

    public function getShipmentsByStatusAndUserID($status, $userID)
    {
        if($status != null && $status == ShipmentStatusConstant::$UNDELIVERED_SHIPMENT_STATUS)
        {
            return $this->shipmentStatusEntityRepository->getUndeliveredShipmentsByUserID($userID);
        }
        elseif ($status != null && $status ==  ShipmentStatusConstant::$ALL_SHIPMENT_STATUS)
        {
            return $this->shipmentStatusEntityRepository->getShipmentsByUserID($userID);
        }
        elseif ($status != null && $status !=  ShipmentStatusConstant::$ALL_SHIPMENT_STATUS && $status != ShipmentStatusConstant::$UNDELIVERED_SHIPMENT_STATUS)
        {
            return $this->shipmentStatusEntityRepository->getShipmentsByStatusAndUserID($status, $userID);
        }
    }

    public function getByShipmentStatusAndShipmentID($shipmentStatus, $shipmentID)
    {
        return $this->shipmentStatusEntityRepository->getByShipmentStatusAndShipmentID($shipmentStatus, $shipmentID);
    }

    public function getAllShipments()
    {
        return $this->shipmentStatusEntityRepository->getAllShipments();
    }

    public function getShipmentByTrackNumberAndUserID($trackNumber, $userID)
    {
        return $this->shipmentStatusEntityRepository->getShipmentByTrackNumberAndUserID($trackNumber, $userID);
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        return $this->shipmentStatusEntityRepository->getShipmentByTrackNumber($trackNumber);
    }

    public function getContainerById($id)
    {
        return $this->containerManager->getContainerById($id);
    }

    public function getAirwaybillById($id)
    {
        return $this->airwaybillManager->getAirwaybillById($id);
    }

    // For shipmentorder/id endpoint + filter API
    public function getShipmentStatusAndTracksByShipmentID($shipmentID)
    {
        return $this->shipmentStatusEntityRepository->getShipmentStatusAndTracksByShipmentID($shipmentID);
    }

    // For filter API
    public function getShipmentStatusAndTracksByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentStatusEntityRepository->getShipmentStatusAndTracksByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function getShipmentLogByShipmentID($shipmentID)
    {
        return $this->shipmentLogManager->getShipmentLogsByShipmentID($shipmentID);
    }

    // For filter endpoint + delete shipment order
    public function getByShipmentID($shipmentID)
    {
        return $this->shipmentStatusEntityRepository->getByShipmentID($shipmentID);
    }

    // For Check Holder API
    public function getShipmentOrderByShipmentID($shipmentID)
    {
        return $this->shipmentStatusEntityRepository->getShipmentOrderByShipmentID($shipmentID);
    }

    // For Track Number
    public function getRandomCode()
    {
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomCode = "";
        $index = 0;

        // Get 7-digits random code
        for ($i = 0; $i < 3; $i++)
        {
            $index = rand(0, strlen($characters));

            $randomCode .= $characters[$index];
        }
        
        for ($i = 3; $i < 7; $i++)
        {
            $randomCode .= random_int(0, 9);
        }

        return $randomCode;
    }
    
    public function deleteAllShipmentStatus()
    {
        return $this->shipmentStatusEntityRepository->deleteAllShipmentStatus();
    }    

}