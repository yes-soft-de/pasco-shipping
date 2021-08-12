<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\TravelFinanceEntity;
use App\Repository\TravelFinanceEntityRepository;
use App\Request\TravelFinanceCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class TravelFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $travelFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TravelFinanceEntityRepository $travelFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->travelFinanceEntityRepository = $travelFinanceEntityRepository;
    }

    public function create(TravelFinanceCreateRequest $request)
    {
        $travelFinanceEntity = $this->autoMapping->map(TravelFinanceCreateRequest::class, TravelFinanceEntity::class, $request);

        $this->entityManager->persist($travelFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $travelFinanceEntity;
    }

}