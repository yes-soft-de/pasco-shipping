<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ShipmentFinanceEntity;
use App\Repository\ShipmentFinanceEntityRepository;
use App\Request\ShipmentFinanceCreateRequest;
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

    public function getCurrentTotalCostByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentFinanceEntityRepository->getCurrentTotalCostByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

}