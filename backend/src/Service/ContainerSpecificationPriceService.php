<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerSpecificationPriceEntity;
use App\Manager\ContainerSpecificationPriceManager;
use App\Request\ContainerSpecificationPriceCreateRequest;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use App\Response\ContainerSpecificationPriceCreateResponse;
use App\Response\ContainerSpecificationPriceGetResponse;
use App\Response\ContainerSpecificationPriceUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerSpecificationPriceService
{
    private $autoMapping;
    private $containerSpecificationPriceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerSpecificationPriceManager $containerSpecificationPriceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerSpecificationPriceManager = $containerSpecificationPriceManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerSpecificationPriceCreateRequest $request)
    {
        $containerSpecificationResult = $this->containerSpecificationPriceManager->create($request);

        if($containerSpecificationResult instanceof ContainerSpecificationPriceEntity)
        {
            return $this->autoMapping->map(ContainerSpecificationPriceEntity::class, ContainerSpecificationPriceCreateResponse::class, $containerSpecificationResult);
        }

        return $containerSpecificationResult;
    }

    public function update(ContainerSpecificationPriceUpdateRequest $request)
    {
        $containerSpecificationResult = $this->containerSpecificationPriceManager->update($request);

        return $this->autoMapping->map(ContainerSpecificationPriceEntity::class, ContainerSpecificationPriceUpdateResponse::class, $containerSpecificationResult);
    }

    public function getAllContainerSpecificationPrices()
    {
        $containerSpecificationPriceResponse = [];

        $containerSpecificationPrices = $this->containerSpecificationPriceManager->getAllContainerSpecificationPrices();

        foreach($containerSpecificationPrices as $containerSpecificationPrice)
        {
            if($containerSpecificationPrice['createdByUserImage'])
            {
                $containerSpecificationPrice['createdByUserImage'] = $this->params . $containerSpecificationPrice['createdByUserImage'];
            }

            if($containerSpecificationPrice['updatedByUserImage'])
            {
                $containerSpecificationPrice['updatedByUserImage'] = $this->params . $containerSpecificationPrice['updatedByUserImage'];
            }

            $containerSpecificationPriceResponse[] = $this->autoMapping->map('array', ContainerSpecificationPriceGetResponse::class, $containerSpecificationPrice);
        }

        return $containerSpecificationPriceResponse;
    }

}