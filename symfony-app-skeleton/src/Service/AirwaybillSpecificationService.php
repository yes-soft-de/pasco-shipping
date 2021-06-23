<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AirwaybillSpecificationEntity;
use App\Manager\AirwaybillSpecificationManager;
use App\Request\AirwaybillSpecificationCreateRequest;
use App\Response\AirwaybillSpecificationCreateResponse;
use App\Response\AirwaybillSpecificationGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillSpecificationService
{
    private $autoMapping;
    private $airwaybillSpecificationManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, AirwaybillSpecificationManager $airwaybillSpecificationManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillSpecificationManager = $airwaybillSpecificationManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillSpecificationCreateRequest $request)
    {
        $airwaybillSpecificationResult = $this->airwaybillSpecificationManager->create($request);

        return $this->autoMapping->map(AirwaybillSpecificationEntity::class, AirwaybillSpecificationCreateResponse::class, $airwaybillSpecificationResult);
    }

    public function getAllAirwaybillSpecifications()
    {
        $airwaybillSpecificationResponse = [];

        $specifications = $this->airwaybillSpecificationManager->getAllAirwaybillSpecifications();

        foreach ($specifications as $specification)
        {
            if($specification['createdByUserImage'])
            {
                $specification['createdByUserImage'] = $this->params . $specification['createdByUserImage'];
            }

            if($specification['updatedByUserImage'])
            {
                $specification['updatedByUserImage'] = $this->params . $specification['updatedByUserImage'];
            }

            $airwaybillSpecificationResponse[] = $this->autoMapping->map('array', AirwaybillSpecificationGetResponse::class, $specification);
        }

        return $airwaybillSpecificationResponse;
    }

    public function deleteAirwaybillSpecificationById($request)
    {
        $result = $this->airwaybillSpecificationManager->deleteAirwaybillSpecificationById($request);

        return $this->autoMapping->map(AirwaybillSpecificationEntity::class, AirwaybillSpecificationGetResponse::class, $result);
    }

}