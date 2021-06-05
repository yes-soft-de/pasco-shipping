<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\TravelEntity;
use App\Repository\TravelEntityRepository;
use App\Request\TravelCreateRequest;
use App\Request\TravelStatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class TravelManager
{
    const CURRENT_TRAVEL_STATUS = "current";

    private $autoMapping;
    private $entityManager;
    private $travelEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TravelEntityRepository $travelEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->travelEntityRepository = $travelEntityRepository;
    }

    public function create(TravelCreateRequest $request)
    {
        $travelEntity = $this->autoMapping->map(TravelCreateRequest::class, TravelEntity::class, $request);

        $travelEntity->setLaunchDate($travelEntity->getLaunchDate());
        $travelEntity->setArrivalDate($travelEntity->getArrivalDate());
        $travelEntity->setStatus($this::CURRENT_TRAVEL_STATUS);
        
        $this->entityManager->persist($travelEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $travelEntity;
    }

    public function updateTravelStatus(TravelStatusUpdateRequest $request)
    {
        $travelEntity = $this->travelEntityRepository->find($request->getId());

        if(!$travelEntity)
        {

        }
        else
        {
            $travelEntity = $this->autoMapping->mapToObject(TravelStatusUpdateRequest::class, TravelEntity::class, $request, $travelEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $travelEntity;
        }
    }

    public function getTravelsByStatus($status)
    {
        return $this->travelEntityRepository->getTravelsByStatus($status);
    }

}