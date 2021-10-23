<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillFCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\PaymentTypeConstant;
use App\Constant\ShipmentOrderPaymentTypeConstant;
use App\Entity\AirwaybillFCLFinanceEntity;
use App\Repository\AirwaybillFCLFinanceEntityRepository;
use App\Request\AirwaybillDistributeStatusCostRequest;
use App\Request\AirwaybillFCLFinanceCreateRequest;
use App\Request\AirwaybillFCLFinanceFilterRequest;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillFCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $trackManager;
    private $shipmentOrderManager;
    private $shipmentFinanceManager;
    private $airwaybillManager;
    private $airwaybillFCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillFCLFinanceEntityRepository $airwaybillFCLFinanceEntityRepository,
                                TrackManager $trackManager, ShipmentLCLFinanceManager $shipmentFinanceManager, ShipmentOrderManager $shipmentOrderManager, AirwaybillManager $airwaybillManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->trackManager = $trackManager;
        $this->shipmentFinanceManager = $shipmentFinanceManager;
        $this->airwaybillManager = $airwaybillManager;
        $this->airwaybillFCLFinanceEntityRepository = $airwaybillFCLFinanceEntityRepository;
    }

    public function create(AirwaybillFCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), AirwaybillFCLFinancialStatusConstant::$FCL_AIR_WAYBILL_FINANCIAL_STATUS_ARRAY))
        {
            $airwaybillFinanceEntity = $this->autoMapping->map(AirwaybillFCLFinanceCreateRequest::class, AirwaybillFCLFinanceEntity::class, $request);

            $airwaybillFinanceEntity->setTrackNumber($this->getTrackNumberByAirWaybillID($request->getAirwaybillID()));
            $airwaybillFinanceEntity->setImportWarehouseID($this->getImportWarehouseIdByAirWaybillID($request->getAirwaybillID()));
            $airwaybillFinanceEntity->setClientUserID($this->getClientUserIdByAirWaybillID($request->getAirwaybillID()));
            $airwaybillFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
            $airwaybillFinanceEntity->setProxyID($this->getProxyIdByAirWaybillID($request->getAirwaybillID()));

            $this->entityManager->persist($airwaybillFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $airwaybillFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function getTrackNumberByAirWaybillID($airWaybillID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($track)
        {
            return $track->getTrackNumber();
        }
    }

    public function getImportWarehouseIdByAirWaybillID($airWaybillID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($track)
        {
            return $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($track->getShipmentID());
        }
    }

    public function getClientUserIdByAirWaybillID($airWaybillID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($track)
        {
            return $this->shipmentOrderManager->getClientUserIdByShipmentOrderID($track->getShipmentID());
        }
    }

    public function getCurrentTotalBuyingCostByFilterOptions($airwaybillID, $status)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getCurrentTotalBuyingCostByFilterOptions($airwaybillID, $status);
    }

    public function getCurrentTotalSellingCostByFilterOptions($airwaybillID, $status)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getCurrentTotalSellingCostByFilterOptions($airwaybillID, $status);
    }

    public function getAirWaybillFCLTotalSellingCostByShipmentID($shipmentID)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getAirWaybillFCLTotalSellingCostByShipmentID($shipmentID);
    }

    public function getAirWaybillFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getAirWaybillFCLBillDetailsByShipmentID($shipmentID);
    }

    public function getAirWaybillFCLBuyingDetailsByShipmentID($shipmentID)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getAirWaybillFCLBuyingDetailsByShipmentID($shipmentID);
    }

    public function getAirWaybillFCLBuyingStagesByShipmentID($shipmentID)
    {
        return $this->airwaybillFCLFinanceEntityRepository->getAirWaybillFCLBuyingStagesByShipmentID($shipmentID);
    }

    public function getShipmentIdByAirWaybillID($airwaybillID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airwaybillID);

        if($track)
        {
            return $track->getShipmentID();
        }
    }

    public function filterAirWaybillFCLFinances(AirwaybillFCLFinanceFilterRequest $request)
    {
        $airwaybillFinances['airwaybillFinances'] = $this->airwaybillFCLFinanceEntityRepository->filterAirWaybillFCLFinances($request->getAirwaybillID(), $request->getStatus(), $request->getPurchaseBill());

        // Get stored shipment info (ID + trackNumber) in the air waybill
        if($airwaybillFinances['airwaybillFinances'])
        {
            foreach($airwaybillFinances['airwaybillFinances'] as $key => $value)
            {
                $airwaybillFinances['airwaybillFinances'][$key]['shipmentInfo'] = $this->trackManager->getByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $value['airwaybillID']);
            }
        }

        // Get current total buying cost
        $currentTotalBuyingCost = $this->getCurrentTotalBuyingCostByFilterOptions($request->getAirwaybillID(), $request->getStatus())['currentTotalBuyingCost'];

        if($currentTotalBuyingCost)
        {
            $airwaybillFinances['currentTotalBuyingCost'] = $currentTotalBuyingCost;
        }
        else
        {
            $airwaybillFinances['currentTotalBuyingCost'] = 0;
        }

        // Get current total selling cost
        $currentTotalSellingCost = $this->getCurrentTotalSellingCostByFilterOptions($request->getAirwaybillID(), $request->getStatus())['currentTotalSellingCost'];

        if($currentTotalSellingCost)
        {
            $airwaybillFinances['currentTotalSellingCost'] = $currentTotalSellingCost;
        }
        else
        {
            $airwaybillFinances['currentTotalSellingCost'] = 0;
        }

        return $airwaybillFinances;
    }

    public function getProxyIdByAirWaybillID($airWaybillID)
    {
        $shipmentID = $this->getShipmentIdByAirWaybillID($airWaybillID);

        $shipmentOrder = $this->shipmentOrderManager->getPaymentTimeAndImportAndExportProxiesIDsByShipmentOrderID($shipmentID);

        if($shipmentOrder)
        {
            if($shipmentOrder['paymentTime'] == ShipmentOrderPaymentTypeConstant::$COLLECT_PAYMENT_TYPE)
            {
                return $shipmentOrder['importProxyID'];
            }
            elseif($shipmentOrder['paymentTime'] == ShipmentOrderPaymentTypeConstant::$PREPAID_PAYMENT_TYPE)
            {
                if($shipmentOrder['exportProxyID'])
                {
                    return $shipmentOrder['exportProxyID'];
                }
                else
                {
                    // Return the agent (proxy) of the export warehouse of the Air waybill
                    $result = $this->airwaybillManager->getProxyIdOfExportWarehouseByAirWaybillID($airWaybillID);

                    if($result)
                    {
                        return $result['exportProxyID'];
                    }
                }
            }
        }
    }

    // Not used any more
    public function distributeAirwaybillCost(AirwaybillDistributeStatusCostRequest $request)
    {
        // get all shipments stored in the air waybill
        $tracks = $this->trackManager->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $request->getAirwaybillID());
        
        if($tracks)
        {
            foreach($tracks as $track)
            {
                // check if shimpent finance of the specific holder and status is exist
                $shipmentFinances = $this->shipmentFinanceManager->getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($track['shipmentID'], $track['trackNumber'],
                HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $request->getAirwaybillID(), $request->getStatus());
            
                if($shipmentFinances)
                {
                    // Update the costs of the shipments
                    foreach($shipmentFinances as $shipmentFinance)
                    {
                        // check the volume of the shipment which is stored into the air waybill
                        if($track['isInOneHolder'])
                        {
                            // The shipment is stored completely in the air waybill => use the whole shipment volume in finding the cost according to the formula:
                            // shipment cost = weight X price of 1 kilogram 
                            $shipmentCost = $track['weight'] * 10;

                            $this->updateShipmentFinanceByAirwaybill($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                        else
                        {
                            // Part of the shipment is stored in the air waybill => use the shipment's volume which is entered in the amount field.
                            // shipment cost = weight X price of 1 kilogram 
                            $shipmentCost = $track['weight'] * 10;

                            $this->updateShipmentFinanceByAirwaybill($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                    }
                }
                else
                {
                    // check the volume of the shipment which is stored into the air waybill
                    if($track['isInOneHolder'])
                    {
                        // The shipment is stored completely in the air waybill => use the whole shipment volume in finding the cost according to the formula:
                        // shipment cost = weight X price of 1 kilogram 
                        $shipmentCost = $track['weight'] * 10;

                        $this->createShipmentFinanceByAirwaybill($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                    else
                    {
                        // Part of the shipment is stored in the air waybill => use the shipment's volume which is entered in the amount field.
                        // shipment cost = weight X price of 1 kilogram 
                        $shipmentCost = $track['weight'] * 10;

                        $this->createShipmentFinanceByAirwaybill($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                }
            }

            return $tracks;
        }
        else
        {
            return "There is not any shipment stored in the air waybill!";
        }
    }

    // Not used any more
    public function createShipmentFinanceByAirwaybill(AirwaybillDistributeStatusCostRequest $request, $shipmentID, $trackNumber, $stageCost)
    {
        $shipmentFinanceRequest = new ShipmentLCLFinanceCreateRequest();

        $shipmentFinanceRequest->setShipmentID($shipmentID);
        $shipmentFinanceRequest->setTrackNumber($trackNumber);

        $shipmentFinanceRequest->setHolderType(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE);

        $shipmentFinanceRequest->setHolderID($request->getAirwaybillID());
        $shipmentFinanceRequest->setShipmentStatus($request->getStatus());
        $shipmentFinanceRequest->setCreatedBy($request->getCreatedBy());
        $shipmentFinanceRequest->setCurrency($request->getCurrency());

        $shipmentFinanceRequest->setStageCost($stageCost);
        
        $this->shipmentFinanceManager->create($shipmentFinanceRequest);
    }

    // Not used any more
    public function updateShipmentFinanceByAirwaybill($shipmentFinanceArray, $updatedBy, $shipmentCost)
    {
        $shipmentFinanceUpdateRequest = $this->autoMapping->map('array', ShipmentFinanceUpdateRequest::class, $shipmentFinanceArray);
        
        $shipmentFinanceUpdateRequest->setUpdatedBy($updatedBy);
        $shipmentFinanceUpdateRequest->setStageCost($shipmentCost);
        
        $this->shipmentFinanceManager->update($shipmentFinanceUpdateRequest);
    }

    public function deleteAllAirWaybillsFCLFinances()
    {
        return $this->airwaybillFCLFinanceEntityRepository->deleteAllAirwaybillsFCLFinances();
    }

}