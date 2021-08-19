<?php

namespace App\Response;

class ShipmentByTrackNumberAndSignedInUserGetResponse
{
    public $tracks;

    public $shipmentStatus;

    public $statusDetails;

    public $isInOneHolder;

    public $packed;

    public $distributorName;

    public $importWarehouseName;

    public $quantity;

    public $orderCreationDate;

    public $orderUpdatingDate;

    public $productCategoryName;

    public $subProductCategoryName;

    public $packetingBy;

    public $weight;

    public $qrCode;

    public $guniQuantity;

    public $log;

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    public $isExternalWarehouse;

}