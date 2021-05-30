<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentStatusEntity;
use App\Manager\ShipmentStatusManager;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\TrackCreateRequest;
use App\Response\ShipmentStatusGetResponse;

class ShipmentStatusService
{
    private $autoMapping;
    private $shipmentStatusManager;
    private $trackService;

    public function __construct(AutoMapping $autoMapping, ShipmentStatusManager $shipmentStatusManager, TrackService $trackService)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->trackService = $trackService;
    }

    public function create(ShipmentStatusCreateRequest $request)
    {
        $shipmentStatusResult = $this->shipmentStatusManager->create($request);

        /**
         * If the shipment is stored in second container and in different travel
         * then, we have an extra step which is inserting a new record in the TackEntity
         * with the shipment new info like the trackNumber and new container ID
         */
        if($request->getHolderID())
        {
            $trackCreateRequest = $this->autoMapping->map(ShipmentStatusEntity::class, TrackCreateRequest::class, $shipmentStatusResult);

            $trackCreateRequest->setHolderType($request->getHolderType());
            $trackCreateRequest->setHolderID($request->getHolderID());
            $trackCreateRequest->setCreatedBy($request->getCreatedBy());

            $this->trackService->create($trackCreateRequest);
        }

        return $this->autoMapping->map(ShipmentStatusEntity::class, ShipmentStatusGetResponse::class, $shipmentStatusResult);
    }

    public function getUnPackedShipments()
    {
        $shipmentsResponse = [];

        $shipmentResults = $this->shipmentStatusManager->getUnPackedShipments();

        foreach($shipmentResults as $shipmentResult)
        {
            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipmentResult);
        }

        return $shipmentsResponse;
    }

}