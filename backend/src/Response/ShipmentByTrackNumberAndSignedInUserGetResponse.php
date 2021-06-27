<?php

namespace App\Response;

class ShipmentByTrackNumberAndSignedInUserGetResponse
{
    public $id; // track record id

    public $shipmentID;

    public $trackNumber;

    public $travelID;

    public $holderType;

    public $holderInfo;

    public $holderID;

    public $createdAt;

    public $updatedAt;

    public $shipmentStatus;

    public $statusDetails;

    public $isInOneHolder;

    public $packed;

    public $target;

    public $supplierID;

    public $supplierName;

    public $distributorName;

    public $exportWarehouseName;

    public $importWarehouseName;

    public $quantity;

    public $image;

    public $orderCreationDate;

    public $orderUpdatingDate;

    public $productCategoryName;

    public $unit;

    public $receiverName;

    public $receiverPhoneNumber;

    public $markID;

    public $packetingBy;

    public $paymentTime;

    public $weight;

    public $qrCode;

    public $guniQuantity;

    public $vehicleIdentificationNumber;

    public $extraSpecification;

    public $trackCreatedByUser;

    public $trackUpdatedByUser;

    public $shipmentStatusCreatedBy;

    public $shipmentStatusUpdatedByBy;

}