<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TrackEntity;
use App\Manager\TrackManager;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateRequest;
use App\Response\ShipmentByTrackNumberAndSignedInUserGetResponse;
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
        $shipment = $this->trackManager->getShipmentByTrackNumber($trackNumber);

        if($shipment['image'])
        {
            $shipment['image'] = $this->params . $shipment['image'];
        }

        if($shipment['clientUserImage'])
        {
            $shipment['clientUserImage'] = $this->params . $shipment['clientUserImage'];
        }

        if ($shipment['trackCreatedByUserImage'])
        {
            $shipment['trackCreatedByUserImage'] = $this->params . $shipment['trackCreatedByUserImage'];
        }

        if ($shipment['trackUpdatedByUserImage'])
        {
            $shipment['trackUpdatedByUserImage'] = $this->params . $shipment['trackUpdatedByUserImage'];
        }

        if ($shipment['orderUpdatedByUserImage'])
        {
            $shipment['orderUpdatedByUserImage'] = $this->params . $shipment['orderUpdatedByUserImage'];
        }

        if($shipment['shipmentStatusCreatedByUserImage'])
        {
            $shipment['shipmentStatusCreatedByUserImage'] = $this->params . $shipment['shipmentStatusCreatedByUserImage'];
        }

        if($shipment['shipmentStatusUpdatedByUserImage'])
        {
            $shipment['shipmentStatusUpdatedByUserImage'] = $this->params . $shipment['shipmentStatusUpdatedByUserImage'];
        }

        return $this->autoMapping->map('array', ShipmentByTrackNumberGetResponse::class, $shipment);
    }

    public function getShipmentByTrackNumberAndUserID($trackNumber, $userID)
    {
        $shipmentResponse = [];

        $shipment = $this->trackManager->getShipmentByTrackNumberAndUserID($trackNumber, $userID);

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

            $shipmentResponse = $this->autoMapping->map('array', ShipmentByTrackNumberAndSignedInUserGetResponse::class, $row);
        }

        return $shipmentResponse;
    }

}