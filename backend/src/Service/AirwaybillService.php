<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AirwaybillEntity;
use App\Manager\AirwaybillManager;
use App\Request\AirwaybillCreateRequest;
use App\Request\AirwaybillUpdateRequest;
use App\Response\AirwaybillCreateResponse;
use App\Response\AirwaybillGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillService
{
    private $autoMapping;
    private $airwaybillManager;
    private $params;
    private $trackService;

    public function __construct(AutoMapping $autoMapping, AirwaybillManager $airwaybillManager, ParameterBagInterface $params, TrackService $trackService)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillManager = $airwaybillManager;
        $this->trackService = $trackService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillCreateRequest $request)
    {
        $airwaybillResult = $this->airwaybillManager->create($request);

        return $this->autoMapping->map(AirwaybillEntity::class, AirwaybillCreateResponse::class, $airwaybillResult);
    }

    public function update(AirwaybillUpdateRequest $request)
    {
        $airwaybillResult = $this->airwaybillManager->update($request);

        return $this->autoMapping->map(AirwaybillEntity::class, AirwaybillGetResponse::class, $airwaybillResult);
    }

    public function getAirwaybillsByStatus($status)
    {
        $airwaybillsResponse = [];

        $airwaybills = $this->airwaybillManager->getAirwaybillsByStatus($status);

        foreach($airwaybills as $airwaybill)
        {
            if($airwaybill['createdByUserImage'])
            {
                $airwaybill['createdByUserImage'] = $this->params . $airwaybill['createdByUserImage'];
            }

            if($airwaybill['updatedByUserImage'])
            {
                $airwaybill['updatedByUserImage'] = $this->params . $airwaybill['updatedByUserImage'];
            }

            $airwaybillsResponse[] = $this->autoMapping->map('array', AirwaybillGetResponse::class, $airwaybill);
        }

        return $airwaybillsResponse;
    }

    public function getAirwaybillById($id)
    {
        $airwaybill = $this->airwaybillManager->getAirwaybillById($id);

        $airwaybill['shipments'] = $this->trackService->getTracksByHolderTypeAndHolderID("airwaybill", $id);
        
        if($airwaybill['createdByUserImage'])
        {
            $airwaybill['createdByUserImage'] = $this->params . $airwaybill['createdByUserImage'];
        }

        if($airwaybill['updatedByUserImage'])
        {
            $airwaybill['updatedByUserImage'] = $this->params . $airwaybill['updatedByUserImage'];
        }

        return $this->autoMapping->map('array', AirwaybillGetResponse::class, $airwaybill);
    }

    public function filterAirwaybills($request)
    {
        $airwaybillsResponse = [];

        $airwaybills = $this->airwaybillManager->filterAirwaybills($request);

        foreach($airwaybills as $airwaybill)
        {
            if($airwaybill['createdByUserImage'])
            {
                $airwaybill['createdByUserImage'] = $this->params . $airwaybill['createdByUserImage'];
            }

            if($airwaybill['updatedByUserImage'])
            {
                $airwaybill['updatedByUserImage'] = $this->params . $airwaybill['updatedByUserImage'];
            }

            $airwaybillsResponse[] = $this->autoMapping->map('array', AirwaybillGetResponse::class, $airwaybill);
        }

        return $airwaybillsResponse;
    }

}