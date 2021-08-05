<?php

namespace App\Manager;

use App\AutoMapping;
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

    public function getAllShipmentsLogs()
    {
        return $this->shipmentLogEntityRepository->getAllShipmentsLogs();
    }

    public function getShipmentLogsByShipmentID($shipmentID)
    {
        return $this->shipmentLogEntityRepository->getAllShipmentLogsByShipmentID($shipmentID);
    }

    // For dashboard
    public function getAllShipmentLogsByShipmentID($shipmentID)
    {
        return $this->shipmentLogEntityRepository->getAllShipmentLogsByShipmentID($shipmentID);
    }
    
    public function deleteAllShipmentsLogs()
    {
        return $this->shipmentLogEntityRepository->deleteAllShipmentsLogs();
    }

}