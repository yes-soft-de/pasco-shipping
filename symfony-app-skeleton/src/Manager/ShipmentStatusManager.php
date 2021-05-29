<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ShipmentStatusEntity;
use App\Repository\ShipmentStatusEntityRepository;
use App\Request\ShipmentStatusCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentStatusManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentStatusEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentStatusEntityRepository $shipmentStatusEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentStatusEntityRepository = $shipmentStatusEntityRepository;
    }

    // Create newly accepted shipment raw in ShipmentStatusEntity
    public function create(ShipmentStatusCreateRequest $request)
    {
        $shipmentStatusEntity = $this->autoMapping->map(ShipmentStatusCreateRequest::class, ShipmentStatusEntity::class, $request);

        $shipmentStatusEntity->setShipmentStatus("accepted");
        $shipmentStatusEntity->setIsInOneHolder(false);
        $shipmentStatusEntity->setPacked(false);
        
        $this->entityManager->persist($shipmentStatusEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shipmentStatusEntity;
    }

    public function getUnPackedShipments()
    {
        return $this->shipmentStatusEntityRepository->getUnPackedShipments();
    }

}