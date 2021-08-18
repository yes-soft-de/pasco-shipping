<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\WarehouseFinanceEntity;
use App\Manager\WarehouseFinanceManager;
use App\Request\WarehouseFinanceCreateRequest;
use App\Request\WarehouseFinanceFilterRequest;
use App\Response\WarehouseFinanceCreateResponse;
use App\Response\WarehouseFinanceGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class WarehouseFinanceService
{
    private $autoMapping;
    private $warehouseFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, WarehouseFinanceManager $warehouseFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->warehouseFinanceManager = $warehouseFinanceManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(WarehouseFinanceCreateRequest $request)
    {
        $warehouseFinanceResult = $this->warehouseFinanceManager->create($request);

        return $this->autoMapping->map(WarehouseFinanceEntity::class, WarehouseFinanceCreateResponse::class, $warehouseFinanceResult);
    }

    public function filterWarehouseFinances(WarehouseFinanceFilterRequest $request)
    {
        $warehouseFinancesResponse = [];
        
        $warehouseFinances = $this->warehouseFinanceManager->filterWarehouseFinances($request);
        
        foreach($warehouseFinances as $warehouseFinance)
        {
            if($warehouseFinance['createdByUserImage'])
            {
                $warehouseFinance['createdByUserImage'] = $this->params . $warehouseFinance['createdByUserImage'];
            }

            if($warehouseFinance['updatedByUserImage'])
            {
                $warehouseFinance['updatedByUserImage'] = $this->params . $warehouseFinance['updatedByUserImage'];
            }

            $warehouseFinancesResponse[] = $this->autoMapping->map('array', WarehouseFinanceGetResponse::class, $warehouseFinance);
        }

        return $warehouseFinancesResponse;
    }

}
