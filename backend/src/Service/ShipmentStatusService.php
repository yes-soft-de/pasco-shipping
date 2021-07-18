<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Entity\ShipmentStatusEntity;
use App\Manager\ShipmentStatusManager;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest;
use App\Request\TrackCreateRequest;
use App\Response\ShipmentByTrackNumberAndSignedInUserGetResponse;
use App\Response\ShipmentByTrackNumberGetResponse;
use App\Response\ShipmentStatusByUserGetResponse;
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

    public function updateShipmentStatusByShipmentIdAndTrackNumber(ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest $request)
    {
        $shipmentStatusEntity = $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($request);
        
        return $this->autoMapping->map(ShipmentStatusEntity::class, ShipmentStatusGetResponse::class, $shipmentStatusEntity);
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

            if($shipmentResult['clientUserImage'])
            {
                $shipmentResult['clientUserImage'] = $this->params . $shipmentResult['clientUserImage'];
            }

            if($shipmentResult['orderUpdatedByUserImage'])
            {
                $shipmentResult['orderUpdatedByUserImage'] = $this->params . $shipmentResult['orderUpdatedByUserImage'];
            }

            if($shipmentResult['shipmentStatusCreatedByUserImage'])
            {
                $shipmentResult['shipmentStatusCreatedByUserImage'] = $this->params . $shipmentResult['shipmentStatusCreatedByUserImage'];
            }

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipmentResult);
        }

        return $shipmentsResponse;
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        $shipmentsResponse = [];

        $shipmentResults = $this->shipmentStatusManager->getShipmentsByTransportationType($transportationType);

        foreach($shipmentResults as $shipmentResult)
        {
            if($shipmentResult['image'])
            {
                $shipmentResult['image'] = $this->params . $shipmentResult['image'];
            }

            if($shipmentResult['clientUserImage'])
            {
                $shipmentResult['clientUserImage'] = $this->params . $shipmentResult['clientUserImage'];
            }

            if($shipmentResult['orderUpdatedByUserImage'])
            {
                $shipmentResult['orderUpdatedByUserImage'] = $this->params . $shipmentResult['orderUpdatedByUserImage'];
            }

            if($shipmentResult['shipmentStatusCreatedByUserImage'])
            {
                $shipmentResult['shipmentStatusCreatedByUserImage'] = $this->params . $shipmentResult['shipmentStatusCreatedByUserImage'];
            }

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipmentResult);
        }

        return $shipmentsResponse;
    }

    public function getShipmentsByStatusAndUserID($status, $userID)
    {
        $shipmentsResponse = [];

        $shipments = $this->shipmentStatusManager->getShipmentsByStatusAndUserID($status, $userID);

        foreach ($shipments as $shipment)
        {
            if ($shipment['image'])
            {
                $shipment['image'] = $this->params . $shipment['image'];
            }

            if ($shipment['clientUserImage'])
            {
                $shipment['clientUserImage'] = $this->params . $shipment['clientUserImage'];
            }

            if ($shipment['orderUpdatedByUserImage'])
            {
                $shipment['orderUpdatedByUserImage'] = $this->params . $shipment['orderUpdatedByUserImage'];
            }

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusByUserGetResponse::class, $shipment);
        }

        return $shipmentsResponse;
    }

    public function getAllShipments()
    {
        $shipmentsResponse = [];

        $shipments = $this->shipmentStatusManager->getAllShipments();

        foreach ($shipments as $shipment)
        {
            if ($shipment['image'])
            {
                $shipment['image'] = $this->params . $shipment['image'];
            }

            if ($shipment['clientUserImage'])
            {
                $shipment['clientUserImage'] = $this->params . $shipment['clientUserImage'];
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

            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipment);
        }

        return $shipmentsResponse;
    }

    public function getShipmentByTrackNumberAndUserID($trackNumber, $userID)
    {
        $shipment = $this->shipmentStatusManager->getShipmentByTrackNumberAndUserID($trackNumber, $userID);
        
        // Get the shipment info from TrackEntity too
        $trackResults = $this->trackService->getByShipmentIdAndTrackNumber($shipment['shipmentID'], $shipment['trackNumber']);

        if($trackResults)
        {
            $shipment['tracks'] = $trackResults;
        }
        else
        {
            $shipment['tracks'] = [];
        }
        
        //Get shipment log
        if($shipment)
        {
            $shipmentLog = $this->shipmentStatusManager->getShipmentLogByShipmentID($shipment['shipmentID']);

            if($shipmentLog)
            {
                $shipment['log'] = $shipmentLog;
            }
            else
            {
                $shipment['log'] = [];
            }
        }

        return $this->autoMapping->map('array', ShipmentByTrackNumberAndSignedInUserGetResponse::class, $shipment);
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        $shipmentResponse = [];

        $shipments = $this->shipmentStatusManager->getShipmentByTrackNumber($trackNumber);

        foreach($shipments as $shipment)
        {
            if($shipment["holderType"] != null)
            {
                if($shipment["holderType"] == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
                {
                    // Get container info
                    $container = $this->shipmentStatusManager->getContainerById($shipment["holderID"]);

                    if ($container)
                    {
                        $shipment["holderInfo"]["IdentificationNumber"] = $container["containerNumber"];
                        $shipment["holderInfo"]["status"] = $container["status"];
                    }
                }

                if($shipment["holderType"] == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
                {
                    // Get airwaybill info
                    $airwaybill = $this->shipmentStatusManager->getAirwaybillById($shipment["holderID"]);

                    if ($airwaybill)
                    {
                        $shipment["holderInfo"]["IdentificationNumber"] = $airwaybill["airwaybillNumber"];
                        $shipment["holderInfo"]["status"] = $airwaybill["status"];
                    }
                }
            }

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

            $shipmentResponse[] = $this->autoMapping->map('array', ShipmentByTrackNumberGetResponse::class, $shipment);
        }

        return $shipmentResponse;
    }

}