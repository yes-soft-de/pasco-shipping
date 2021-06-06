<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TrackEntity;
use App\Manager\TrackManager;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateRequest;
use App\Response\ShipmentByTrackNumberGetResponse;
use App\Response\TrackCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class TrackService
{
    private $autoMapping;
    private $trackManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, TrackManager $trackManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->trackManager = $trackManager;
        $this->params = $params->get('upload_base_url') . '/';
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
            if($row['image'])
            {
                $row['image'] = $this->params . $row['image'];
            }

            if($row['clientUserImage'])
            {
                $row['clientUserImage'] = $this->params . $row['clientUserImage'];
            }

            $shipmentResponse = $this->autoMapping->map('array', ShipmentByTrackNumberGetResponse::class, $row);
        }

        return $shipmentResponse;
    }

}