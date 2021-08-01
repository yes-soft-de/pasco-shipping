<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\TravelStatusConstant;
use App\Entity\TravelEntity;
use App\Repository\TravelEntityRepository;
use App\Request\DeleteRequest;
use App\Request\TrackUpdateByTravelIdRequest;
use App\Request\TravelCreateRequest;
use App\Request\TravelFilterRequest;
use App\Request\TravelStatusUpdateRequest;
use App\Request\TravelUpdateRequest;
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

    public function update(TravelUpdateRequest $request)
    {
        $travelEntity = $this->travelEntityRepository->find($request->getId());

        if(!$travelEntity)
        {
            return $travelEntity;
        }
        else
        {
            $travelEntity = $this->autoMapping->mapToObject(TravelUpdateRequest::class, TravelEntity::class, $request, $travelEntity);

            $travelEntity->setLaunchDate($request->getLaunchDate());
            $travelEntity->setArrivalDate($request->getArrivalDate());

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $travelEntity;
        }
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

    public function getTravelByID($id)
    {
        $travel = $this->travelEntityRepository->getTravelByID($id);

        if($travel)
        {
            $travel['holders'] = $this->trackManager->getTracksByTravelID($travel['id']);
        }
        
        return $travel;
    }

    public function getCountOfTravelsByType($type)
    {
        return count($this->travelEntityRepository->findBy(["type"=>$type]));
    }

    public function getCountOfAllTravels()
    {
        return count($this->travelEntityRepository->findAll());
    }

    public function filterTravels(TravelFilterRequest $request)
    {
        if($request->getType() != null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByType($request->getType());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() != null)
        {
            return $this->travelEntityRepository->getTravelsByStatus($request->getStatus());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() != null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByLaunchCountry($request->getLaunchCountry());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() != null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByDestinationCountry($request->getDestinationCountry());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() != null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByLaunchDate($request->getLaunchDate());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() != null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByArrivalDate($request->getArrivalDate());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() != null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByShipperID($request->getShipperID());
        }
        elseif($request->getType() != null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() != null)
        {
            return $this->travelEntityRepository->getTravelsByTypeAndStatus($request->getType(), $request->getStatus());
        }
        elseif($request->getType() != null && $request->getLaunchCountry() != null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByTypeAndLaunchCountry($request->getType(), $request->getLaunchCountry());
        }
        elseif($request->getType() != null && $request->getLaunchCountry() != null && $request->getDestinationCountry() != null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByTypeAndLaunchAndDestinationCountry($request->getType(), $request->getLaunchCountry(), $request->getDestinationCountry());
        }
        elseif($request->getType() != null && $request->getLaunchCountry() != null && $request->getDestinationCountry() != null && $request->getLaunchDate() != null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() == null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelsByTypeAndLaunchAndDestinationCountriesAndLaunchDate($request->getType(), $request->getLaunchCountry(), 
            $request->getDestinationCountry(), $request->getLaunchDate());
        }
        elseif($request->getType() == null && $request->getLaunchCountry() == null && $request->getDestinationCountry() == null && $request->getLaunchDate() == null && 
        $request->getArrivalDate() == null && $request->getTravelNumber() != null && $request->getShipperID() == null && $request->getStatus() == null)
        {
            return $this->travelEntityRepository->getTravelByNumber($request->getTravelNumber());
        }
    }

    public function delete(DeleteRequest $request)
    {
        $item = $this->travelEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            //Check if the travel isn't being used yet
            $result = $this->trackManager->getTracksByTravelID($request->getId());
            
            if(!$result)
            {
                //its safe to delete the travel
                $this->entityManager->remove($item);
                $this->entityManager->flush();
            }
            else
            {
                return "The travel is being used. We can not delete it!";
            }
        }

        return $item;
    }

}