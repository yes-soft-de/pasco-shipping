<?php

namespace App\Response;

class AirwaybillFilterResponse
{
    public $id;

    public $airwaybillNumber;

    public $createdAt;

    public $updatedAt;

    public $status;

    public $createdByUser;

    public $createdByUserImage;

    public $updatedByUser;

    public $updatedByUserImage;

    public $type;

    public $used;

    public $specificationName;

    public $subcontractName;

    public $consigneeName;

    public $shipperName;

    public $carrierName;

    public $portName;

    public $exportPortName;

    public $location;

    public $freeWeight;

    public $shipmentID;

    public $weight;

    public $consignee;

    public $shippingStatus;

    public $clientUserID;

    public $clientUserName;

    public $totalGunnyQuantity;

    public $totalReceivedShipmentsQuantity;

    public $exportWarehouseID;

    public $exportWarehouseName;

    public $exportCity;

    public $exportCountryName;

    public $exportCountryID;

    public $shipments = [];

    public $exportLocationName;

}