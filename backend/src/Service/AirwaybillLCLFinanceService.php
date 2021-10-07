<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AirwaybillLCLFinanceEntity;
use App\Manager\AirwaybillLCLFinanceManager;
use App\Request\AirwaybillLCLFinanceCreateRequest;
use App\Request\AirwaybillLCLFinanceFilterRequest;
use App\Response\AirwaybillLCLFinanceCreateResponse;
use App\Response\AirwaybillLCLFinanceFilterResponse;
use App\Response\DeleteAllGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillLCLFinanceService
{
    private $autoMapping;
    private $airwaybillLCLFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, AirwaybillLCLFinanceManager $airwaybillLCLFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillLCLFinanceManager = $airwaybillLCLFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillLCLFinanceCreateRequest $request)
    {
        $airWaybillLCLFinanceResult = $this->airwaybillLCLFinanceManager->create($request);

        if($airWaybillLCLFinanceResult instanceof AirwaybillLCLFinanceEntity)
        {
            return $this->autoMapping->map(AirwaybillLCLFinanceEntity::class, AirwaybillLCLFinanceCreateResponse::class, $airWaybillLCLFinanceResult);
        }

        return $airWaybillLCLFinanceResult;
    }

    public function filterAirWaybillsLCLFinances(AirwaybillLCLFinanceFilterRequest $request)
    {
        $airWaybillsLCLFinances = $this->airwaybillLCLFinanceManager->filterAirWaybillsLCLFinances($request);
        
        foreach($airWaybillsLCLFinances['airWaybillFinances'] as $airWaybillsLCLFinance)
        {
            if($airWaybillsLCLFinance['createdByUserImage'])
            {
                $airWaybillsLCLFinance['createdByUserImage'] = $this->params . $airWaybillsLCLFinance['createdByUserImage'];
            }

            if($airWaybillsLCLFinance['updatedByUserImage'])
            {
                $airWaybillsLCLFinance['updatedByUserImage'] = $this->params . $airWaybillsLCLFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', AirwaybillLCLFinanceFilterResponse::class, $airWaybillsLCLFinances);
    }

    public function deleteAllAirWaybillsLCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->airwaybillLCLFinanceManager->deleteAllAirWaybillsLCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}