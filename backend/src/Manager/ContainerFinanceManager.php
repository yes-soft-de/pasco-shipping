<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ContainerFinanceEntity;
use App\Repository\ContainerFinanceEntityRepository;
use App\Request\ContainerFinanceCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $containerFinanceEntityRepository;
    private $trackManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerFinanceEntityRepository $containerFinanceEntityRepository,
     TrackManager $trackManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerFinanceEntityRepository = $containerFinanceEntityRepository;
        $this->trackManager = $trackManager;
    }

    public function create(ContainerFinanceCreateRequest $request)
    {
        $containerFinanceEntity = $this->autoMapping->map(ContainerFinanceCreateRequest::class, ContainerFinanceEntity::class, $request);

        $this->entityManager->persist($containerFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerFinanceEntity;
    }

}