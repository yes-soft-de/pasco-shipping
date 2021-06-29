<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentStatusConstant;
use App\Entity\ShipmentStatusEntity;
use App\Repository\ShipmentStatusEntityRepository;
use App\Request\ShipmentFilterRequest;
use App\Request\ShipmentLogCreateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusUpdateRequest;
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

        $this->shipmentLogManager->create($shipmentLogRequest);

        return $shipmentStatusEntity;
    }

    public function getUnPackedShipments()
    {
        return $this->shipmentStatusEntityRepository->getUnPackedShipments();
    }

    public function updateShipmentStatusByShipmentIdAndTrackNumber(ShipmentStatusUpdateRequest $request)
    {
        $shipmentStatusEntity = $this->shipmentStatusEntityRepository->getByShipmentIdAndTrackNumber($request->getShipmentID(), $request->getTrackNumber());
        
        if(!$shipmentStatusEntity)
        {
            return $shipmentStatusEntity;
        }
        else
        {
            $shipmentStatusEntity = $this->autoMapping->mapToObject(ShipmentStatusUpdateRequest::class, ShipmentStatusEntity::class, 
            $request, $shipmentStatusEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            //Now, we insert a new log raw
            $shipmentLogRequest = new ShipmentLogCreateRequest();

            $shipmentLogRequest->setShipmentID($shipmentStatusEntity->getShipmentID());
            $shipmentLogRequest->setShipmentStatus($shipmentStatusEntity->getShipmentStatus());
            $shipmentLogRequest->setTrackNumber($shipmentStatusEntity->getTrackNumber());

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

    public function filterShipments(ShipmentFilterRequest $request)
    {
        $status = $request->getStatus();
        $paymentTime = $request->getPaymentTime();
        $transportationType = $request->getTransportationType();
        $createdAt = $request->getCreatedAt();
        $finishedAt = $request->getFinishedAt();
        $launchCountry = $request->getLaunchCountry();
        $targetCountry = $request->getTargetCountry();

        if($status != null && $paymentTime != null && $transportationType != null && $launchCountry == null && $targetCountry == null
            && $createdAt == null && $finishedAt == null)
        {
            return $this->shipmentStatusEntityRepository->filterShipmentsByStatusAndPaymentTimeAndTransportationType($status, $paymentTime, $transportationType);
        }
        elseif($status != null && $paymentTime != null && $transportationType != null && $launchCountry == null && $targetCountry == null
            && $createdAt != null && $finishedAt == null)
        {
            return $this->shipmentStatusEntityRepository->filterShipmentsByStatusAndPaymentTimeAndTransportationTypeAndCreationDate($status, $paymentTime, $transportationType, $createdAt);
        }
    }

    public function getContainerById($id)
    {
        return $this->containerManager->getContainerById($id);
    }

    public function getAirwaybillById($id)
    {
        return $this->airwaybillManager->getAirwaybillById($id);
    }

    public function getShipmentByShipmentID($shipmentID)
    {
        return $this->shipmentStatusEntityRepository->findBy(["shipmentID"=>$shipmentID]);
    }

    public function getRandomCode()
    {
        // Get 5-digits random number
        $data = random_int(0, 9) . random_int(0, 9) . random_int(0, 9) . random_int(0, 9) . random_int(0, 9);

        return  vsprintf('%s%s%s%s%s', str_split(($data)));
    }    

}