<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillLCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\PaymentTypeConstant;
use App\Entity\AirwaybillLCLFinanceEntity;
use App\Repository\AirwaybillLCLFinanceEntityRepository;
use App\Request\AirwaybillLCLFinanceCreateRequest;
use App\Request\AirwaybillLCLFinanceFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillLCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $trackManager;
    private $shipmentOrderManager;
    private $airwaybillLCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillLCLFinanceEntityRepository $airwaybillLCLFinanceEntityRepository,
                                TrackManager $trackManager, ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackManager = $trackManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->airwaybillLCLFinanceEntityRepository = $airwaybillLCLFinanceEntityRepository;
    }

    public function create(AirwaybillLCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), AirwaybillLCLFinancialStatusConstant::$LCL_AIRWAYBILL_FINANCIAL_STATUS_ARRAY))
        {
            $airWaybillLCLFinanceEntity = $this->autoMapping->map(AirwaybillLCLFinanceCreateRequest::class, AirwaybillLCLFinanceEntity::class, $request);

            $airWaybillLCLFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
            $airWaybillLCLFinanceEntity->setProxyID($this->getProxyIdByAirWaybillID($request->getAirwaybillID()));

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

    public function getAirWaybillLCLFinancesByAirWaybillID($airWaybillID)
    {
        return $this->airwaybillLCLFinanceEntityRepository->getAirWaybillLCLFinancesByAirWaybillID($airWaybillID);
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

    public function getProxyIdByAirWaybillID($airWaybillID)
    {
        /**
         * Get the proxy ID of the export warehouse as following:
         * first get one shipment ID of the shipments being stored in the air waybill
         * then get the export warehouse ID of the shipment
         */
        $track = $this->trackManager->getOneTrackByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($track)
        {
            $result = $this->shipmentOrderManager->getExportProxyIDByShipmentOrderID($track->getShipmentID());

            if($result)
            {
                return $result['exportProxyID'];
            }
        }
    }

    public function deleteAllAirWaybillsLCLFinances()
    {
        return $this->airwaybillLCLFinanceEntityRepository->deleteAllAirWaybillsLCLFinances();
    }

}