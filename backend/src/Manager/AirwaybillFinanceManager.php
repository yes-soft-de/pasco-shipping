<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\AirwaybillFinanceEntity;
use App\Repository\AirwaybillFinanceEntityRepository;
use App\Request\AirwaybillFinanceCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $airwaybillFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillFinanceEntityRepository $airwaybillFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillFinanceEntityRepository = $airwaybillFinanceEntityRepository;
    }

    public function create(AirwaybillFinanceCreateRequest $request)
    {
        $airwaybillFinanceEntity = $this->autoMapping->map(AirwaybillFinanceCreateRequest::class, AirwaybillFinanceEntity::class, $request);

        $this->entityManager->persist($airwaybillFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $airwaybillFinanceEntity;
    }

}