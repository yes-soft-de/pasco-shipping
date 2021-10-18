<?php

namespace App\Response;

class ContainerGetResponse
{
    public $id;

    public $containerNumber;

    public $createdAt;

    public $updatedAt;

    public $status;

    public $createdByUser;

    public $createdByUserImage;

    public $updatedByUser;

    public $updatedByUserImage;

    public $type;

    public $used;

    public $subcontractName;

    public $consigneeName;

    public $shipperName;

    public $carrierName;

    public $portName;

    public $location;

    public $specificationName;

    public $freeCapacity;

    public $clientUserID;

    public $shipmentID;

    public $consignee;

    public $shippingStatus;

    public $exportCity;

    public $exportCountryName;

    public $totalGunnyQuantity;

    public $totalReceivedShipmentsQuantity;

    public $shipments = [];

}