<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TravelEntity;
use App\Manager\TravelManager;
use App\Request\TravelCreateRequest;
use App\Request\TravelStatusUpdateRequest;
use App\Response\TravelCreateResponse;
use App\Response\TravelGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class TravelService
{
    private $autoMapping;
    private $travelManager;
    private $params;

    public function __construct(AutoMapping $autoMapping,TravelManager $travelManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->travelManager = $travelManager;
        $this->params = $params->get('upload_base_url') . '/';
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
            if($row['createdByUserImage'])
            {
                $row['createdByUserImage'] = $this->params . $row['createdByUserImage'];
            }

            if($row['updatedByUserImage'])
            {
                $row['updatedByUserImage'] = $this->params . $row['updatedByUserImage'];
            }

            $travelsResponse[] = $this->autoMapping->map('array', TravelGetResponse::class, $row);
        }

        return $travelsResponse;
    }

    public function getTravelsByTypeAndStatus($type, $status)
    {
        $travelsResponse = [];

        $travels = $this->travelManager->getTravelsByTypeAndStatus($type, $status);
        
        foreach($travels as $row)
        {   
            if($row['createdByUserImage'])
            {
                $row['createdByUserImage'] = $this->params . $row['createdByUserImage'];
            }

            if($row['updatedByUserImage'])
            {
                $row['updatedByUserImage'] = $this->params . $row['updatedByUserImage'];
            }

            $travelsResponse[] = $this->autoMapping->map('array', TravelGetResponse::class, $row);
        }

        return $travelsResponse;
    }

    public function getTravelByID($id)
    {
        $travel = $this->travelManager->getTravelByID($id);

        if($travel['createdByUserImage'])
        {
            $travel['createdByUserImage'] = $this->params . $travel['createdByUserImage'];
        }

        if($travel['updatedByUserImage'])
        {
            $travel['updatedByUserImage'] = $this->params . $travel['updatedByUserImage'];
        }

        return $this->autoMapping->map('array', TravelGetResponse::class, $travel);
    }

}