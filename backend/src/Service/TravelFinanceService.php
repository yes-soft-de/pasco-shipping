<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TravelFinanceEntity;
use App\Manager\TravelFinanceManager;
use App\Request\TravelFinanceCreateRequest;
use App\Response\TravelFinanceCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class TravelFinanceService
{
    private $autoMapping;
    private $travelFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, TravelFinanceManager $travelFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->travelFinanceManager = $travelFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(TravelFinanceCreateRequest $request)
    {
        $travelFinanceResult = $this->travelFinanceManager->create($request);

        return $this->autoMapping->map(TravelFinanceEntity::class, TravelFinanceCreateResponse::class, $travelFinanceResult);
    }

}