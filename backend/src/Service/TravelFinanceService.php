<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\TravelFinanceEntity;
use App\Manager\TravelFinanceManager;
use App\Request\TravelFinanceCreateRequest;
use App\Request\TravelFinanceFilterRequest;
use App\Response\TravelFinanceCreateResponse;
use App\Response\TravelFinanceGetResponse;
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

    public function filterTravelFinances(TravelFinanceFilterRequest $request)
    {
        $travelFinances = $this->travelFinanceManager->filterTravelFinances($request);
        
        foreach($travelFinances['travelFinances'] as $travelFinance)
        {
            if($travelFinance['createdByUserImage'])
            {
                $travelFinance['createdByUserImage'] = $this->params . $travelFinance['createdByUserImage'];
            }

            if($travelFinance['updatedByUserImage'])
            {
                $travelFinance['updatedByUserImage'] = $this->params . $travelFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', TravelFinanceGetResponse::class, $travelFinances);
    }

}