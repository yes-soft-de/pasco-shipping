<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\TravelFinanceEntity;
use App\Repository\TravelFinanceEntityRepository;
use App\Request\TravelFinanceCreateRequest;
use App\Request\TravelFinanceFilterRequest;
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

    public function getCurrentTotalCostByFilterOptions($containerID, $status)
    {
        return $this->travelFinanceEntityRepository->getCurrentTotalCostByFilterOptions($containerID, $status);
    }

    public function filterTravelFinances(TravelFinanceFilterRequest $request)
    {
        $travelFinances['travelFinances'] = $this->travelFinanceEntityRepository->filterTravelFinances($request->getTravelID(), $request->getStatus());
        
        $travelFinances['currentTotalCost'] = $this->getCurrentTotalCostByFilterOptions($request->getTravelID(), $request->getStatus())['currentTotalCost'];

        return $travelFinances;
    }

    public function deleteAllTravelsFinances()
    {
        return $this->travelFinanceEntityRepository->deleteAllTravelsFinances();
    }

}