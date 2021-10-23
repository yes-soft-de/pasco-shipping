<?php

namespace App\Manager;

use App\Constant\ShippingTypeConstant;
use App\Constant\ShippingWayConstant;

class ShipmentPurchaseBillManager
{
    private $shipmentOrderManager;
    private $trackManager;
    private $airwaybillFCLFinanceManager;
    private $airwaybillLCLFinanceManager;
    private $containerFCLFinanceManager;
    private $containerLCLFinanceManager;

    public function __construct(ShipmentOrderManager $shipmentOrderManager, TrackManager $trackManager, AirwaybillFCLFinanceManager $airwaybillFCLFinanceManager,
     AirwaybillLCLFinanceManager $airwaybillLCLFinanceManager, ContainerFCLFinanceManager $containerFCLFinanceManager, ContainerLCLFinanceManager $containerLCLFinanceManager)
    {
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->trackManager = $trackManager;
        $this->airwaybillFCLFinanceManager = $airwaybillFCLFinanceManager;
        $this->airwaybillLCLFinanceManager = $airwaybillLCLFinanceManager;
        $this->containerFCLFinanceManager = $containerFCLFinanceManager;
        $this->containerLCLFinanceManager = $containerLCLFinanceManager;
    }

    public function getPurchaseBillByShipmentID($shipmentID)
    {
        $purchasesBill = [];
        $purchasesBill['holderFinances'] = [];
        $purchasesBill['currentTotalBuyingCost'] = 0;

        $shipmentOrder = $this->shipmentOrderManager->getHolderTypeAndTransportationTypeByShipmentOrderID($shipmentID);

        $tracks = $this->trackManager->getByShipmentID($shipmentID);

        if($shipmentOrder['transportationType'] == ShippingWayConstant::$AIR_SHIPPING_WAY)
        {
            $purchasesBill['shippingWay'] = ShippingWayConstant::$AIR_SHIPPING_WAY;

            if($shipmentOrder['holderType'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
            {
                $purchasesBill['holderFinances'] = $this->airwaybillFCLFinanceManager->getAirWaybillFCLBuyingStagesByShipmentID($shipmentID);

                if($purchasesBill['holderFinances'])
                {
                    foreach($purchasesBill['holderFinances'] as $finance)
                    {
                        $purchasesBill['currentTotalBuyingCost'] += $finance['buyingCost'];
                    }
                }
            }
            elseif($shipmentOrder['holderType'] == ShippingTypeConstant::$LCL_SHIPPING_TYPE)
            {
                if($tracks)
                {
                    foreach($tracks as $track)
                    {
                        $airWaybillFinances = $this->airwaybillLCLFinanceManager->getAirWaybillLCLFinancesByAirWaybillID($track['holderID']);

                        if($airWaybillFinances)
                        {
                            foreach($airWaybillFinances as $airWaybillFinance)
                            {
                                $purchasesBill['holderFinances'][] = $airWaybillFinance;

                                $purchasesBill['currentTotalBuyingCost'] += $airWaybillFinance['buyingCost'];
                            }
                        }
                    }
                }
            }
        }
        elseif($shipmentOrder['transportationType'] == ShippingWayConstant::$SEA_SHIPPING_WAY)
        {
            $purchasesBill['shippingWay'] = ShippingWayConstant::$SEA_SHIPPING_WAY;

            if($shipmentOrder['holderType'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
            {
                $purchasesBill['holderFinances'] = $this->containerFCLFinanceManager->getContainerFCLBuyingStagesByShipmentID($shipmentID);

                if($purchasesBill['holderFinances'])
                {
                    foreach($purchasesBill['holderFinances'] as $finance)
                    {
                        $purchasesBill['currentTotalBuyingCost'] += $finance['buyingCost'];
                    }
                }
            }
            elseif($shipmentOrder['holderType'] == ShippingTypeConstant::$LCL_SHIPPING_TYPE)
            {
                if($tracks)
                {
                    foreach($tracks as $track)
                    {
                        $containerFinances = $this->containerLCLFinanceManager->getContainerLCLFinancesByContainerID($track['holderID']);

                        if($containerFinances)
                        {
                            foreach($containerFinances as $containerFinance)
                            {
                                $purchasesBill['holderFinances'][] = $containerFinance;

                                $purchasesBill['currentTotalBuyingCost'] += $containerFinance['buyingCost'];
                            }
                        }
                    }
                }
            }
        }

        return $purchasesBill;
    }

}