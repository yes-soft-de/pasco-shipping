<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AirwaybillFCLFinanceEntity;
use App\Manager\AirwaybillFCLFinanceManager;
use App\Request\AirwaybillDistributeStatusCostRequest;
use App\Request\AirwaybillFCLFinanceCreateRequest;
use App\Request\AirwaybillFCLFinanceFilterRequest;
use App\Response\AirwaybillFCLFinanceCreateResponse;
use App\Response\AirwaybillFCLFinanceGetResponse;
use App\Response\DeleteAllGetResponse;
use App\Response\TrackByHolderTypeAndHolderIdGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillFCLFinanceService
{
    private $autoMapping;
    private $airwaybillFCLFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, AirwaybillFCLFinanceManager $airwaybillFCLFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillFCLFinanceManager = $airwaybillFCLFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillFCLFinanceCreateRequest $request)
    {
        $airwaybillFCLFinanceEntity = $this->airwaybillFCLFinanceManager->create($request);

        if($airwaybillFCLFinanceEntity instanceof AirwaybillFCLFinanceEntity)
        {
            return $this->autoMapping->map(AirwaybillFCLFinanceEntity::class, AirwaybillFCLFinanceCreateResponse::class, $airwaybillFCLFinanceEntity);
        }

        return $airwaybillFCLFinanceEntity;
    }

    public function filterAirWaybillFCLFinances(AirwaybillFCLFinanceFilterRequest $request)
    {
        $airwaybillFinances = $this->airwaybillFCLFinanceManager->filterAirWaybillFCLFinances($request);
        
        foreach($airwaybillFinances['airwaybillFinances'] as $airwaybillFinance)
        {
            if($airwaybillFinance['createdByUserImage'])
            {
                $airwaybillFinance['createdByUserImage'] = $this->params . $airwaybillFinance['createdByUserImage'];
            }

            if($airwaybillFinance['updatedByUserImage'])
            {
                $airwaybillFinance['updatedByUserImage'] = $this->params . $airwaybillFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', AirwaybillFCLFinanceGetResponse::class, $airwaybillFinances);
    }

    // Not used any more
    public function distributeAirwaybillCost(AirwaybillDistributeStatusCostRequest $request)
    {
        $tracksResponse = [];
        
        $tracks = $this->airwaybillFCLFinanceManager->distributeAirwaybillCost($request);

        if(is_array($tracks))
        {
            foreach($tracks as $track)
            {
                $tracksResponse[] = $this->autoMapping->map('array', TrackByHolderTypeAndHolderIdGetResponse::class, $track);
            }
        }

        return $tracks;
    }

    public function deleteAllAirWaybillsFCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->airwaybillFCLFinanceManager->deleteAllAirWaybillsFCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}