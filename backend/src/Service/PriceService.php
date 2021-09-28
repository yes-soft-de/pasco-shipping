<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\PriceEntity;
use App\Manager\PriceManager;
use App\Request\PriceUpdateRequest;
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

    public function update(PriceUpdateRequest $request)
    {
        $portsResult = $this->priceManager->update($request);

        return $this->autoMapping->map(PriceEntity::class, PriceUpdateResponse::class, $portsResult);
    }

    public function getPrices()
    {
        $price = $this->priceManager->getPrices();

        if($price['updatedByUserImage'])
        {
            $price['updatedByUserImage'] = $this->params . $price['updatedByUserImage'];
        }

        return $this->autoMapping->map('array', PriceGetResponse::class, $price);
    }

}