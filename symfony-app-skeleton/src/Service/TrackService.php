<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TrackEntity;
use App\Manager\TrackManager;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateRequest;
use App\Response\ShipmentByTrackNumberGetResponse;
use App\Response\TrackCreateResponse;

class TrackService
{
    private $autoMapping;
    private $trackManager;

    public function __construct(AutoMapping $autoMapping, TrackManager $trackManager)
    {
        $this->autoMapping = $autoMapping;
        $this->trackManager = $trackManager;
    }

    public function create(TrackCreateRequest $request)
    {
        $trackResult = $this->trackManager->create($request);

        return $this->autoMapping->map(TrackEntity::class, TrackCreateResponse::class, $trackResult);
    }

    public function updateByHolderIdAndTrackNumber(TrackUpdateRequest $request)
    {
        $trackResult = $this->trackManager->updateByHolderIdAndTrackNumber($request);

        return $this->autoMapping->map(TrackEntity::class, TrackCreateResponse::class, $trackResult);
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        $shipmentResponse = [];

        $shipment = $this->trackManager->getShipmentByTrackNumber($trackNumber);
        
        foreach($shipment as $row)
        {
            $shipmentResponse = $this->autoMapping->map('array', ShipmentByTrackNumberGetResponse::class, $row);
        }

        return $shipmentResponse;
    }

}