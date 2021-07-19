<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Entity\TrackEntity;
use App\Manager\TrackManager;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateByHolderTypeAndIdRequest;
use App\Request\TrackUpdateRequest;
use App\Response\TrackCreateResponse;
use App\Response\TrackGetResponse;
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

    public function updateByHolderTypeAndHolderID(TrackUpdateByHolderTypeAndIdRequest $request)
    {
        $trackResponse = [];

        $tracks = $this->trackManager->updateByHolderTypeAndHolderID($request);

        foreach($tracks as $track)
        {
            $trackResponse[] = $this->autoMapping->map(TrackEntity::class, TrackGetResponse::class, $track);
        }

        return $trackResponse;
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $trackResponse = [];

        $trackResults = $this->trackManager->getByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
        foreach($trackResults as $result)
        {
            if($result["holderType"] != null)
            {
                if($result["holderType"] == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
                {
                    // Get container info
                    $container = $this->trackManager->getContainerById($result["holderID"]);

                    if ($container)
                    {
                        $result["holderInfo"]["IdentificationNumber"] = $container["containerNumber"];
                        $result["holderInfo"]["status"] = $container["status"];
                    }
                }

                if($result["holderType"] == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
                {
                    // Get airwaybill info
                    $airwaybill = $this->trackManager->getAirwaybillById($result["holderID"]);

                    if ($airwaybill)
                    {
                        $result["holderInfo"]["IdentificationNumber"] = $airwaybill["airwaybillNumber"];
                        $result["holderInfo"]["status"] = $airwaybill["status"];
                    }
                }
            }

            $trackResponse[] = $this->autoMapping->map('array', TrackGetResponse::class, $result);
        }
        
        return $trackResponse;
    }

}