<?php

namespace App\Response;

class ContainerFilterResponse
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

    public $consignee;

    public $clientUserID;

    public $clientUserName;

    public $shipmentID;

    public $shippingStatus;

    public $totalGunnyQuantity;

    public $totalReceivedShipmentsQuantity;

    public $shipments = [];

}