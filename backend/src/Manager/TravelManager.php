<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\TravelStatusConstant;
use App\Entity\TravelEntity;
use App\Repository\TravelEntityRepository;
use App\Request\TrackUpdateByTravelIdRequest;
use App\Request\TravelCreateRequest;
use App\Request\TravelStatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class TravelManager
{
    private $autoMapping;
    private $entityManager;
    private $travelEntityRepository;
    private $trackManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TravelEntityRepository $travelEntityRepository, TrackManager $trackManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->travelEntityRepository = $travelEntityRepository;
        $this->trackManager = $trackManager;
    }

    public function create(TravelCreateRequest $request)
    {
        $travelEntity = $this->autoMapping->map(TravelCreateRequest::class, TravelEntity::class, $request);

        $travelEntity->setLaunchDate($travelEntity->getLaunchDate());
        $travelEntity->setArrivalDate($travelEntity->getArrivalDate());
        $travelEntity->setStatus(TravelStatusConstant::$CURRENT_TRAVEL_STATUS);
        
        $this->entityManager->persist($travelEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $travelEntity;
    }

    public function updateTravelStatus(TravelStatusUpdateRequest $request)
    {
        if($request->getStatus() == TravelStatusConstant::$STARTED_TRAVEL_STATUS || $request->getStatus() == TravelStatusConstant::$RELEASED_TRAVEL_STATUS)
        {
            $travelEntity = $this->travelEntityRepository->find($request->getId());

            if(!$travelEntity)
            {
                return $travelEntity;
            }
            else
            {
                $travelEntity = $this->autoMapping->mapToObject(TravelStatusUpdateRequest::class, TravelEntity::class, $request, $travelEntity);

                $this->entityManager->flush();
                $this->entityManager->clear();

                // Now, update all shipments status uploaded onto the travel
                $trackUpdateByTravelRequest = $this->autoMapping->map(TravelStatusUpdateRequest::class, TrackUpdateByTravelIdRequest::class, $request);

                $trackUpdateByTravelRequest->setTravelID($request->getId());
                $trackUpdateByTravelRequest->setShipmentStatus($request->getStatus());

                $this->trackManager->updateByTravelID($trackUpdateByTravelRequest);

                return $travelEntity;
            }
        }
    }

    public function getTravelsByStatus($status)
    {
        return $this->travelEntityRepository->getTravelsByStatus($status);
    }

    public function getTravelsByTypeAndStatus($type, $status)
    {
        return $this->travelEntityRepository->getTravelsByTypeAndStatus($type, $status);
    }

    public function getTravelsByID($id)
    {
        return $this->travelEntityRepository->getTravelsByID($id);
    }

    public function getCountOfTravelsByType($type)
    {
        return count($this->travelEntityRepository->findBy(["type"=>$type]));
    }

    public function getCountOfAllTravels()
    {
        return count($this->travelEntityRepository->findAll());
    }

}