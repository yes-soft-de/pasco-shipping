<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TravelEntity;
use App\Manager\TravelManager;
use App\Request\TravelCreateRequest;
use App\Request\TravelStatusUpdateRequest;
use App\Response\TravelCreateResponse;
use App\Response\TravelGetResponse;

class TravelService
{
    private $autoMapping;
    private $travelManager;

    public function __construct(AutoMapping $autoMapping,TravelManager $travelManager)
    {
        $this->autoMapping = $autoMapping;
        $this->travelManager = $travelManager;
    }

    public function create(TravelCreateRequest $request)
    {
        $travelResult = $this->travelManager->create($request);

        return $this->autoMapping->map(TravelEntity::class, TravelCreateResponse::class, $travelResult);
    }

    public function updateTravelStatus(TravelStatusUpdateRequest $request)
    {
        $travelEntity = $this->travelManager->updateTravelStatus($request);

        return $this->autoMapping->map(TravelEntity::class, TravelGetResponse::class, $travelEntity);
    }

    public function getTravelsByStatus($status)
    {
        $travelsResponse = [];

        $travels = $this->travelManager->getTravelsByStatus($status);
        
        foreach($travels as $row)
        {
            $travelsResponse[] = $this->autoMapping->map('array', TravelGetResponse::class, $row);
        }

        return $travelsResponse;
    }

}