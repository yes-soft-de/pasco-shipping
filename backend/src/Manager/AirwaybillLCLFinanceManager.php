<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillLCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Entity\AirwaybillLCLFinanceEntity;
use App\Repository\AirwaybillLCLFinanceEntityRepository;
use App\Request\AirwaybillLCLFinanceCreateRequest;
use App\Request\AirwaybillLCLFinanceFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillLCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $airwaybillLCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillLCLFinanceEntityRepository $airwaybillLCLFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillLCLFinanceEntityRepository = $airwaybillLCLFinanceEntityRepository;
    }

    public function create(AirwaybillLCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), AirwaybillLCLFinancialStatusConstant::$LCL_AIRWAYBILL_FINANCIAL_STATUS_ARRAY))
        {
            $airWaybillLCLFinanceEntity = $this->autoMapping->map(AirwaybillLCLFinanceCreateRequest::class, AirwaybillLCLFinanceEntity::class, $request);

            $this->entityManager->persist($airWaybillLCLFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $airWaybillLCLFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function getCurrentTotalCostByFilterOptions($airWaybillID, $status)
    {
        return $this->airwaybillLCLFinanceEntityRepository->getCurrentTotalCostByFilterOptions($airWaybillID, $status);
    }

    public function filterAirWaybillsLCLFinances(AirwaybillLCLFinanceFilterRequest $request)
    {
        $airWaybillFinances['airWaybillFinances'] = $this->airwaybillLCLFinanceEntityRepository->filterAirWaybillLCLFinances($request->getAirwaybillID(), $request->getStatus());

        $currentTotalCost = $this->getCurrentTotalCostByFilterOptions($request->getAirwaybillID(), $request->getStatus())['currentTotalCost'];

        if($currentTotalCost)
        {
            $airWaybillFinances['currentTotalCost'] = $currentTotalCost;
        }
        else
        {
            $airWaybillFinances['currentTotalCost'] = 0;
        }

        return $airWaybillFinances;
    }

    public function deleteAllAirWaybillsLCLFinances()
    {
        return $this->airwaybillLCLFinanceEntityRepository->deleteAllAirWaybillsLCLFinances();
    }

}