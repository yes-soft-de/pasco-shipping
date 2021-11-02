<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\PriceEntity;
use App\Manager\PriceManager;
use App\Request\PriceCreateRequest;
use App\Request\PriceUpdateRequest;
use App\Response\PriceCreateResponse;
use App\Response\PriceGetResponse;
use App\Response\PriceUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class PriceService
{
    private $autoMapping;
    private $priceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, PriceManager $priceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->priceManager = $priceManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(PriceCreateRequest $request)
    {
        $portsResult = $this->priceManager->create($request);

        return $this->autoMapping->map(PriceEntity::class, PriceCreateResponse::class, $portsResult);
    }

    public function update(PriceUpdateRequest $request)
    {
        $portsResult = $this->priceManager->update($request);

        return $this->autoMapping->map(PriceEntity::class, PriceUpdateResponse::class, $portsResult);
    }

    public function getPrices()
    {
        $results = $this->priceManager->getPrices();

        foreach($results['prices'] as $result)
        {
            if($result['createdByUserImage'])
            {
                $result['createdByUserImage'] = $this->params . $result['createdByUserImage'];
            }

            if($result['updatedByUserImage'])
            {
                $result['updatedByUserImage'] = $this->params . $result['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', PriceGetResponse::class, $results);
    }

    public function delete($request)
    {
        $result = $this->priceManager->delete($request);

        if($result instanceof PriceEntity)
        {
            return $this->autoMapping->map(PriceEntity::class, PriceCreateResponse::class, $result);
        }

        return $result;
    }

}