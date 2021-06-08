<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentStatusEntity;
use App\Manager\ShipmentStatusManager;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\TrackCreateRequest;
use App\Response\ShipmentStatusGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentStatusService
{
    private $autoMapping;
    private $shipmentStatusManager;
    private $trackService;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentStatusManager $shipmentStatusManager, TrackService $trackService, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->trackService = $trackService;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipmentStatusCreateRequest $request)
    {
        $shipmentStatusResult = $this->shipmentStatusManager->create($request);

        /**
         * The shipment is stored in second container and in different travel
         * then, we have an extra step which is inserting a new record in the TackEntity
         * with the shipment new info like the trackNumber and new container ID
         */
        $trackCreateRequest = $this->autoMapping->map(ShipmentStatusEntity::class, TrackCreateRequest::class, $shipmentStatusResult);

        if($request->getHolderID())
        {
            $trackCreateRequest->setHolderType($request->getHolderType());
            $trackCreateRequest->setHolderID($request->getHolderID());
        }

        $trackCreateRequest->setShipmentStatus($request->getShipmentStatus());
        $trackCreateRequest->setCreatedBy($request->getCreatedBy());

        $this->trackService->create($trackCreateRequest);

        return $this->autoMapping->map(ShipmentStatusEntity::class, ShipmentStatusGetResponse::class, $shipmentStatusResult);
    }

    public function getUnPackedShipments()
    {
        $shipmentsResponse = [];

        $shipmentResults = $this->shipmentStatusManager->getUnPackedShipments();

        foreach($shipmentResults as $shipmentResult)
        {
            if($shipmentResult['image'])
            {
                $shipmentResult['image'] = $this->params . $shipmentResult['image'];
            }

            if($shipmentResult['userImage'])
            {
                $shipmentResult['userImage'] = $this->params . $shipmentResult['userImage'];
            }

            if($shipmentResult['updatedByUserImage'])
            {
                $shipmentResult['updatedByUserImage'] = $this->params . $shipmentResult['updatedByUserImage'];
            }

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipmentResult);
        }

        return $shipmentsResponse;
    }

}