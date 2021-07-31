<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AirwaybillFinanceEntity;
use App\Manager\AirwaybillFinanceManager;
use App\Request\AirwaybillFinanceCreateRequest;
use App\Response\AirwaybillFinanceCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillFinanceService
{
    private $autoMapping;
    private $airwaybillFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, AirwaybillFinanceManager $airwaybillFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillFinanceManager = $airwaybillFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillFinanceCreateRequest $request)
    {
        $airwaybillEntityResult = $this->airwaybillFinanceManager->create($request);

        return $this->autoMapping->map(AirwaybillFinanceEntity::class, AirwaybillFinanceCreateResponse::class, $airwaybillEntityResult);
    }

}