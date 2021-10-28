<?php

namespace App\Response;

class AirwaybillGetResponse
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

    public $clientUserID;

    public $weight;

    public $consignee;

    public $shippingStatus;

    public $exportCity;

    public $exportCountryName;

    public $totalGunnyQuantity;

    public $totalReceivedShipmentsQuantity;

    public $shipments = [];

    public $exportLocationName;

}