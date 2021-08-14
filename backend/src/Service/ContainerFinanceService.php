<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerFinanceEntity;
use App\Manager\ContainerFinanceManager;
use App\Request\ContainerDistributeStatusCostRequest;
use App\Request\ContainerFinanceCreateRequest;
use App\Request\ContainerFinanceFilterRequest;
use App\Response\ContainerFinanceCreateResponse;
use App\Response\ContainerFinanceGetResponse;
use App\Response\TrackByHolderTypeAndHolderIdGetResponse;
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

    public function filterContainerFinances(ContainerFinanceFilterRequest $request)
    {
        $containerFinances = $this->containerFinanceManager->filterContainerFinances($request);
        
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

        return $this->autoMapping->map('array', ContainerFinanceGetResponse::class, $containerFinances);
    }

    public function distributeContainerCost(ContainerDistributeStatusCostRequest $request)
    {
        $tracksResponse = [];
        
        $tracks = $this->containerFinanceManager->distributeContainerCost($request);

        if(is_array($tracks))
        {
            foreach($tracks as $track)
            {
                $tracksResponse[] = $this->autoMapping->map('array', TrackByHolderTypeAndHolderIdGetResponse::class, $track);
            }
        }

        return $tracks;
    }

}