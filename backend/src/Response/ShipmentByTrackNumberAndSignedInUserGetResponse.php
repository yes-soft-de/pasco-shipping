<?php

namespace App\Response;

class ShipmentByTrackNumberAndSignedInUserGetResponse
{
    public $trackNumber;

    public $holderType;

    public $holderInfo;

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

    public $packetingBy;

    public $weight;

    public $qrCode;

    public $guniQuantity;

}