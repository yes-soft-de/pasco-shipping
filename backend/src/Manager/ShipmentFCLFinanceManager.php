<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\PaymentTypeConstant;
use App\Constant\ShipmentFCLFinancialStatusConstant;
use App\Constant\ShipmentOrderPaymentTypeConstant;
use App\Entity\ShipmentFCLFinanceEntity;
use App\Repository\ShipmentFCLFinanceEntityRepository;
use App\Request\ShipmentFCLFinanceCreateRequest;
use App\Request\ShipmentFCLFinanceFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentFCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $shipmentFCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentFCLFinanceEntityRepository $shipmentFCLFinanceEntityRepository,
     ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentFCLFinanceEntityRepository = $shipmentFCLFinanceEntityRepository;
    }

    public function create(ShipmentFCLFinanceCreateRequest $request)
    {
        if(in_array($request->getShipmentStatus(), ShipmentFCLFinancialStatusConstant::$FCL_SHIPMENT_FINANCIAL_STATUS_ARRAY))
        {
            $shipmentFCLFinanceEntity = $this->autoMapping->map(ShipmentFCLFinanceCreateRequest::class, ShipmentFCLFinanceEntity::class, $request);

            // Get the import warehouse id to insert it with the financial stage details
            $importWarehouseID = $this->getImportWarehouseIdByShipmentID($request->getShipmentID());

            if($importWarehouseID)
            {
                $shipmentFCLFinanceEntity->setImportWarehouseID($importWarehouseID);
            }

            /**
             * Check if the payment time is Collect, then automatically set the payment type to cash, and the fund is the fund of
             * the target country
             */
            $result = $this->getPaymentTimeAndImportAndExportProxiesIDsByShipmentOrderID($request->getShipmentID());

            if($result['paymentTime'] == ShipmentOrderPaymentTypeConstant::$COLLECT_PAYMENT_TYPE)
            {
                $shipmentFCLFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
                $shipmentFCLFinanceEntity->setProxyID($result['importProxyID']);
            }
            elseif($result['paymentTime'] == ShipmentOrderPaymentTypeConstant::$PREPAID_PAYMENT_TYPE)
            {
                if($result['exportProxyID'])
                {
                    $shipmentFCLFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
                    $shipmentFCLFinanceEntity->setProxyID($result['exportProxyID']);
                }
            }

            $this->entityManager->persist($shipmentFCLFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentFCLFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function getShipmentFCLTotalCostByShipmentID($shipmentID)
    {
        return $this->shipmentFCLFinanceEntityRepository->getShipmentFCLTotalCostByShipmentID($shipmentID);
    }

    public function getShipmentFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->shipmentFCLFinanceEntityRepository->getShipmentFCLBillDetailsByShipmentID($shipmentID);
    }

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID)
    {
        return $this->shipmentFCLFinanceEntityRepository->getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID);
    }

    public function filterShipmentFCLFinances(ShipmentFCLFinanceFilterRequest $request)
    {
        $shipmentFinances['shipmentFinances'] = $this->shipmentFCLFinanceEntityRepository->filterShipmentFCLFinances($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(),
        $request->getExportWarehouseID(), $request->getImportWarehouseID());

        // Get total Cost of the stages
        $currentTotalCost = $this->getCurrentTotalCostByFilterOptions($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(),
        $request->getExportWarehouseID(), $request->getImportWarehouseID())['currentTotalCost'];

        if($currentTotalCost)
        {
            $shipmentFinances['currentTotalCost'] = $currentTotalCost;
        }
        else
        {
            $shipmentFinances['currentTotalCost'] = 0;
        }

        return $shipmentFinances;
    }

    public function getImportWarehouseIdByShipmentID($shipmentID)
    {
        return $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($shipmentID);
    }

    public function getPaymentTimeAndImportAndExportProxiesIDsByShipmentOrderID($shipmentID)
    {
        return $this->shipmentOrderManager->getPaymentTimeAndImportAndExportProxiesIDsByShipmentOrderID($shipmentID);
    }
    
    public function deleteAllShipmentFCLFinances()
    {
        return $this->shipmentFCLFinanceEntityRepository->deleteAllShipmentFCLFinances();
    }

}