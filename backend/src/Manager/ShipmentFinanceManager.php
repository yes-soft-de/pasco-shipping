<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ShipmentFinanceEntity;
use App\Repository\ShipmentFinanceEntityRepository;
use App\Request\ShipmentFinanceCreateRequest;
use App\Request\ShipmentFinanceFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentFinanceEntityRepository $shipmentFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentFinanceEntityRepository = $shipmentFinanceEntityRepository;
    }

    public function create(ShipmentFinanceCreateRequest $request)
    {
        $shipmentFinanceEntity = $this->autoMapping->map(ShipmentFinanceCreateRequest::class, ShipmentFinanceEntity::class, $request);

        $this->entityManager->persist($shipmentFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shipmentFinanceEntity;
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentFinanceEntityRepository->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus)
    {
        return $this->shipmentFinanceEntityRepository->getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus);
    }

    public function filterShipmentFinances(ShipmentFinanceFilterRequest $request)
    {
        return $this->shipmentFinanceEntityRepository->filterShipmentFinances($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus());
    }
    
    public function deleteAllShipmentFinances()
    {
        return $this->shipmentFinanceEntityRepository->deleteAllShipmentFinances();
    }

}