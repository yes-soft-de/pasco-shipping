<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\TrackEntity;
use App\Repository\TrackEntityRepository;
use App\Request\ShipmentStatusUpdateRequest;
use App\Request\TrackCreateRequest;
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
        // Check the holder type by counting the holder ID digits
        
        // if(count($request->getHolderID()) == 11)
        // {
        //     $request->setHolderType("container");
        // }

        $trackEntity = $this->autoMapping->map(TrackCreateRequest::class, TrackEntity::class, $request);
        
        $this->entityManager->persist($trackEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Then, we update the record related to the shipment in the ShipmentStatusEntity

        $shipmentStatusRequest = $this->autoMapping->map(TrackCreateRequest::class, ShipmentStatusUpdateRequest::class, $request);

        $shipmentStatusRequest->setPacked(true);

        $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);

        return $trackEntity;
    }

}