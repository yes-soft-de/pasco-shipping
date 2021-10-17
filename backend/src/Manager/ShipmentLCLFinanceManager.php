<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentLCLFinancialStatusConstant;
use App\Constant\ShippingWayConstant;
use App\Entity\ShipmentLCLFinanceEntity;
use App\Repository\ShipmentLCLFinanceEntityRepository;
use App\Request\PricesFilterRequest;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentLCLFinanceFilterRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentLCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $priceManager;
    private $shipmentLCLFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentLCLFinanceEntityRepository $shipmentLCLFinanceEntityRepository,
     ShipmentOrderManager $shipmentOrderManager, PriceManager $priceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->priceManager = $priceManager;
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

        // Get price of one Kilo / CBM
        if($shipmentFinances['shipmentFinances'])
        {
            foreach($shipmentFinances['shipmentFinances'] as $key => $value)
            {
                $shipmentFinances['shippingType'] = $value['transportationType'];

                $shipmentFinances['price'] = $this->getOneKiloOrCBMPriceByShipmentID($value['shipmentID']);

                $shipmentFinances['volume'] = $value['volume'];

                $shipmentFinances['weight'] = $value['weight'];

                $shipmentFinances['shippingCost'] = round($this->getShippingCostByTransportationTypeAndShipmentVolumeAndWeight($value['shipmentID'], $value['transportationType'],
                    $value['volume'], $value['weight']), 2);
            }
        }

        // Get total Cost of the stages
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

    public function getOneKiloOrCBMPriceByShipmentID($shipmentID)
    {
        $result = $this->shipmentOrderManager->getHolderTypeAndTransportationTypeByShipmentOrderID($shipmentID);

        if($result)
        {
            if($result['transportationType'] == ShippingWayConstant::$SEA_SHIPPING_WAY)
            {
                // Get one CBM price
                return $this->priceManager->getOneCBMPriceByShipmentID($shipmentID);

            }
            elseif($result['transportationType'] == ShippingWayConstant::$AIR_SHIPPING_WAY)
            {
                // Get one Kilo price
                return $this->priceManager->getOneKiloPriceByShipmentID($shipmentID);
            }
        }
    }

    public function getShippingCostByTransportationTypeAndShipmentVolumeAndWeight($shipmentID, $transportationType, $volume, $weight)
    {
        if($transportationType == ShippingWayConstant::$AIR_SHIPPING_WAY)
        {
            return $this->getOneKiloOrCBMPriceByShipmentID($shipmentID) * $weight;
        }
        elseif($transportationType == ShippingWayConstant::$SEA_SHIPPING_WAY)
        {
            return $this->getOneKiloOrCBMPriceByShipmentID($shipmentID) * $volume;
        }
    }
    
    public function deleteAllShipmentLCLFinances()
    {
        return $this->shipmentLCLFinanceEntityRepository->deleteAllShipmentLCLFinances();
    }

}