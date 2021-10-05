<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerLCLFinanceEntity;
use App\Manager\ContainerLCLFinanceManager;
use App\Request\ContainerFCLFinanceFilterRequest;
use App\Request\ContainerLCLFinanceCreateRequest;
use App\Request\ContainerLCLFinanceFilterRequest;
use App\Response\ContainerLCLFinanceCreateResponse;
use App\Response\ContainerLCLFinanceFilterResponse;
use App\Response\DeleteAllGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerLCLFinanceService
{
    private $autoMapping;
    private $containerLCLFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerLCLFinanceManager $containerLCLFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerLCLFinanceManager = $containerLCLFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerLCLFinanceCreateRequest $request)
    {
        $containerLCLFinanceResult = $this->containerLCLFinanceManager->create($request);

        if($containerLCLFinanceResult instanceof ContainerLCLFinanceEntity)
        {
            return $this->autoMapping->map(ContainerLCLFinanceEntity::class, ContainerLCLFinanceCreateResponse::class, $containerLCLFinanceResult);
        }

        return $containerLCLFinanceResult;
    }

    public function filterContainerLCLFinances(ContainerLCLFinanceFilterRequest $request)
    {
        $containerFinances = $this->containerLCLFinanceManager->filterContainerLCLFinances($request);
        
        foreach($containerFinances['containerFinances'] as $containerFinance)
        {
            if($containerFinance['createdByUserImage'])
            {
                $containerFinance['createdByUserImage'] = $this->params . $containerFinance['createdByUserImage'];
            }

            if($containerFinance['updatedByUserImage'])
            {
                $containerFinance['updatedByUserImage'] = $this->params . $containerFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', ContainerLCLFinanceFilterResponse::class, $containerFinances);
    }

    public function deleteAllContainersLCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->containerLCLFinanceManager->deleteAllContainersLCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}