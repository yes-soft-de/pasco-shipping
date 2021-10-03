<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerSpecificationEntity;
use App\Manager\ContainerSpecificationManager;
use App\Request\ContainerSpecificationCreateRequest;
use App\Request\ContainerSpecificationUpdateRequest;
use App\Response\ContainerSpecificationCreateResponse;
use App\Response\ContainerSpecificationGetResponse;
use App\Response\ContainerSpecificationUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerSpecificationService
{
    private $autoMapping;
    private $containerSpecificationManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerSpecificationManager $containerSpecificationManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerSpecificationManager = $containerSpecificationManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerSpecificationCreateRequest $request)
    {
        $containerSpecificationResult = $this->containerSpecificationManager->create($request);

        return $this->autoMapping->map(ContainerSpecificationEntity::class, ContainerSpecificationCreateResponse::class, $containerSpecificationResult);
    }

    public function update(ContainerSpecificationUpdateRequest $request)
    {
        $containerSpecificationResult = $this->containerSpecificationManager->update($request);

        return $this->autoMapping->map(ContainerSpecificationEntity::class, ContainerSpecificationUpdateResponse::class, $containerSpecificationResult);
    }

    public function getAllContainerSpecifications()
    {
        $containerSpecificationResponse = [];

        $specifications = $this->containerSpecificationManager->getAllContainerSpecifications();

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

            $containerSpecificationResponse[] = $this->autoMapping->map('array', ContainerSpecificationGetResponse::class, $specification);
        }

        return $containerSpecificationResponse;
    }

    public function deleteContainerSpecificationById($request)
    {
        $result = $this->containerSpecificationManager->deleteContainerSpecificationById($request);

        if($result instanceof ContainerSpecificationEntity)
        {
            return $this->autoMapping->map(ContainerSpecificationEntity::class, ContainerSpecificationGetResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

}