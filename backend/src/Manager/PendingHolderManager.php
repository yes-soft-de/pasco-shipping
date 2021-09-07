<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\PendingHolderEntity;
use App\Repository\PendingHolderEntityRepository;
use App\Request\PendingHolderCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class PendingHolderManager
{
    private $autoMapping;
    private $entityManager;
    private $pendingHolderEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, PendingHolderEntityRepository $pendingHolderEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->pendingHolderEntityRepository = $pendingHolderEntityRepository;
    }

    public function create(PendingHolderCreateRequest $request)
    {
        $pendingHolderEntity = $this->autoMapping->map(PendingHolderCreateRequest::class, PendingHolderEntity::class, $request);

        $this->entityManager->persist($pendingHolderEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $pendingHolderEntity;
    }

    // To be used lately in waiting shipments response
    public function getPendingHoldersByShipmentID($shipmentID)
    {
        return $this->pendingHolderEntityRepository->getPendingHoldersByShipmentID($shipmentID);
    }

}