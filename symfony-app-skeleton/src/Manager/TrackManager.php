<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\TrackEntity;
use App\Repository\TrackEntityRepository;
use App\Request\ShipmentStatusUpdateRequest;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class TrackManager
{
    private $autoMapping;
    private $entityManager;
    private $trackEntityRepository;
    private $shipmentStatusManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TrackEntityRepository $trackEntityRepository,
     ShipmentStatusManager $shipmentStatusManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackEntityRepository = $trackEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
    }

    public function create(TrackCreateRequest $request)
    {
        // First, we insert new raw in the TrackEntity
        $trackEntity = $this->autoMapping->map(TrackCreateRequest::class, TrackEntity::class, $request);
        
        $this->entityManager->persist($trackEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Then, we update the record related to the shipment in the ShipmentStatusEntity
        $shipmentStatusRequest = $this->autoMapping->map(TrackCreateRequest::class, ShipmentStatusUpdateRequest::class, $request);

        $shipmentStatusRequest->setUpdatedBy($request->getCreatedBy());

        $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);

        return $trackEntity;
    }

    public function updateByHolderIdAndTrackNumber(TrackUpdateRequest $request)
    {
        //Firstly, we update the track record
        $trackEntity = $this->trackEntityRepository->getByHolderIdAndTrackNumber($request->getHolderID(), $request->getTrackNumber());

        if(!$trackEntity)
        {
            return $trackEntity;
        }
        else
        {
            $trackEntity = $this->autoMapping->mapToObject(TrackUpdateRequest::class, TrackEntity::class, $request, $trackEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            if($trackEntity)
            {
                // Secondly, update the status in the ShipmentStatusEntity
                $shipmentStatusRequest = $this->autoMapping->map(TrackUpdateRequest::class, ShipmentStatusUpdateRequest::class, $request);

                $shipmentStatusRequest->setShipmentID($trackEntity->getShipmentID());
                $shipmentStatusRequest->setUpdatedBy($request->getUpdatedBy());

                $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);
            }

            return $trackEntity;
        }
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        return $this->trackEntityRepository->getShipmentByTrackNumber($trackNumber);
    }

}