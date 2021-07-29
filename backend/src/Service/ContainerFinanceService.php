<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerFinanceEntity;
use App\Manager\ContainerFinanceManager;
use App\Request\ContainerFinanceCreateRequest;
use App\Response\ContainerFinanceCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerFinanceService
{
    private $autoMapping;
    private $containerFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerFinanceManager $containerFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerFinanceManager = $containerFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerFinanceCreateRequest $request)
    {
        $containerFinanceResult = $this->containerFinanceManager->create($request);

        return $this->autoMapping->map(ContainerFinanceEntity::class, ContainerFinanceCreateResponse::class, $containerFinanceResult);
    }

}