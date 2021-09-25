<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReceivedShipmentEntity;
use App\Repository\ReceivedShipmentEntityRepository;
use App\Request\ReceivedShipmentCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReceivedShipmentManager
{
    private $autoMapping;
    private $entityManager;
    private $receivedShipmentEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ReceivedShipmentEntityRepository $receivedShipmentEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->receivedShipmentEntityRepository = $receivedShipmentEntityRepository;
    }

    public function create(ReceivedShipmentCreateRequest $request)
    {
        $receivedShipmentEntity = $this->autoMapping->map(ReceivedShipmentCreateRequest::class, ReceivedShipmentEntity::class, $request);

        $this->entityManager->persist($receivedShipmentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $receivedShipmentEntity;
    }

}