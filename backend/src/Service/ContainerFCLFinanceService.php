<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerFCLFinanceEntity;
use App\Manager\ContainerFCLFinanceManager;
use App\Request\ContainerDistributeStatusCostRequest;
use App\Request\ContainerFCLFinanceCreateRequest;
use App\Request\ContainerFCLFinanceFilterRequest;
use App\Response\ContainerFCLFinanceCreateResponse;
use App\Response\ContainerFCLFinanceFilterResponse;
use App\Response\DeleteAllGetResponse;
use App\Response\TrackByHolderTypeAndHolderIdGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerFCLFinanceService
{
    private $autoMapping;
    private $containerFCLFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerFCLFinanceManager $containerFCLFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerFCLFinanceManager = $containerFCLFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerFCLFinanceCreateRequest $request)
    {
        $containerFinanceResult = $this->containerFCLFinanceManager->create($request);

        if($containerFinanceResult instanceof ContainerFCLFinanceEntity)
        {
            return $this->autoMapping->map(ContainerFCLFinanceEntity::class, ContainerFCLFinanceCreateResponse::class, $containerFinanceResult);
        }

        return $containerFinanceResult;
    }

    public function filterContainerFCLFinances(ContainerFCLFinanceFilterRequest $request)
    {
        $containerFinances = $this->containerFCLFinanceManager->filterContainerFCLFinances($request);
        
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

        return $this->autoMapping->map('array', ContainerFCLFinanceFilterResponse::class, $containerFinances);
    }

    public function distributeContainerCost(ContainerDistributeStatusCostRequest $request)
    {
        $tracksResponse = [];
        
        $tracks = $this->containerFCLFinanceManager->distributeContainerCost($request);

        if(is_array($tracks))
        {
            foreach($tracks as $track)
            {
                $tracksResponse[] = $this->autoMapping->map('array', TrackByHolderTypeAndHolderIdGetResponse::class, $track);
            }
        }

        return $tracks;
    }

    public function deleteAllContainersFCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->containerFCLFinanceManager->deleteAllContainersFCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}