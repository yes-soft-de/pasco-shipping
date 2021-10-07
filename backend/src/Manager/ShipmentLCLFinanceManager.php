<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentLCLFinancialStatusConstant;
use App\Entity\ShipmentLCLFinanceEntity;
use App\Repository\ShipmentLCLFinanceEntityRepository;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentLCLFinanceFilterRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentLCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $shipmentLCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentLCLFinanceEntityRepository $shipmentLCLFinanceEntityRepository,
     ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentLCLFinanceEntityRepository = $shipmentLCLFinanceEntityRepository;
    }

    public function create(ShipmentLCLFinanceCreateRequest $request)
    {
        if(in_array($request->getShipmentStatus(), ShipmentLCLFinancialStatusConstant::$LCL_SHIPMENT_FINANCIAL_STATUS_ARRAY))
        {
            $shipmentFinanceEntity = $this->autoMapping->map(ShipmentLCLFinanceCreateRequest::class, ShipmentLCLFinanceEntity::class, $request);

            $importWarehouseID = $this->getImportWarehouseIdByShipmentID($request->getShipmentID());

            if($importWarehouseID)
            {
                $shipmentFinanceEntity->setImportWarehouseID($importWarehouseID);
            }

            $this->entityManager->persist($shipmentFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function update(ShipmentFinanceUpdateRequest $request)
    {
        $shipmentFinanceEntity = $this->shipmentLCLFinanceEntityRepository->find($request->getId());

        if(!$shipmentFinanceEntity)
        {

        }
        else
        {
            $shipmentFinanceEntity = $this->autoMapping->mapToObject(ShipmentFinanceUpdateRequest::class, ShipmentLCLFinanceEntity::class, $request, $shipmentFinanceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentFinanceEntity;
        }
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentLCLFinanceEntityRepository->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function getShipmentLCLTotalCostByShipmentID($shipmentID)
    {
        return $this->shipmentLCLFinanceEntityRepository->getShipmentLCLTotalCostByShipmentID($shipmentID);
    }

    public function getShipmentLCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->shipmentLCLFinanceEntityRepository->getShipmentLCLBillDetailsByShipmentID($shipmentID);
    }

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID, $containerID, $airwaybillID, $travelID)
    {
        return $this->shipmentLCLFinanceEntityRepository->getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID,
        $containerID, $airwaybillID, $travelID);
    }

    public function filterShipmentLCLFinances(ShipmentLCLFinanceFilterRequest $request)
    {
        $shipmentFinances['shipmentFinances'] = $this->shipmentLCLFinanceEntityRepository->filterShipmentLCLFinances($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(),
        $request->getExportWarehouseID(), $request->getImportWarehouseID(), $request->getContainerID(), $request->getAirwaybillID(), $request->getTravelID());

        $currentTotalCost = $this->getCurrentTotalCostByFilterOptions($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(),
        $request->getExportWarehouseID(), $request->getImportWarehouseID(), $request->getContainerID(), $request->getAirwaybillID(), $request->getTravelID())['currentTotalCost'];

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

    public function getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($shipmentID, $trackNumber, $holderType, $holderID, $shipmentStatus)
    {
        return $this->shipmentLCLFinanceEntityRepository->getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($shipmentID, $trackNumber, $holderType, $holderID, $shipmentStatus);
    }

    public function getImportWarehouseIdByShipmentID($shipmentID)
    {
        return $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($shipmentID);
    }
    
    public function deleteAllShipmentLCLFinances()
    {
        return $this->shipmentLCLFinanceEntityRepository->deleteAllShipmentLCLFinances();
    }

}