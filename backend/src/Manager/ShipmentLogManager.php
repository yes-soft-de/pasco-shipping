<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentStatusConstant;
use App\Entity\ShipmentLogEntity;
use App\Repository\ShipmentLogEntityRepository;
use App\Request\ShipmentLogCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentLogManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentLogEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentLogEntityRepository $shipmentLogEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentLogEntityRepository = $shipmentLogEntityRepository;
    }

    public function create(ShipmentLogCreateRequest $request)
    {
        $shipmentLogEntity = $this->autoMapping->map(ShipmentLogCreateRequest::class, ShipmentLogEntity::class, $request);

        $this->entityManager->persist($shipmentLogEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shipmentLogEntity;
    }

    public function createShipmentLogsUntillSpecificStatus(ShipmentLogCreateRequest $request)
    {
        $key = array_search($request->getShipmentStatus(), ShipmentStatusConstant::$SHIPMENT_STATUS_ARRAY);
        
        for($index = 1; $index <= $key; $index++)
        {
            $request->setShipmentStatus(ShipmentStatusConstant::$SHIPMENT_STATUS_ARRAY[$index]);

            $this->create($request);
        }
    }

    public function getAllShipmentsLogs()
    {
        return $this->shipmentLogEntityRepository->getAllShipmentsLogs();
    }

    public function getShipmentLogsByShipmentID($shipmentID)
    {
        return $this->shipmentLogEntityRepository->getAllShipmentLogsByShipmentID($shipmentID);
    }

    // For track my shipment API
    public function getShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentLogEntityRepository->getShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    // For dashboard
    public function getAllShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentLogEntityRepository->getAllShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }
    
    public function deleteAllShipmentsLogs()
    {
        return $this->shipmentLogEntityRepository->deleteAllShipmentsLogs();
    }

}