<?php

namespace App\Response;

class ShipmentByTrackNumberGetResponse
{
    public $id; // track record id

    public $shipmentID;

    public $trackNumber;

    public $travelID;

    public $holderType;

    public $holderID;

    public $holderInfo;

    public $amount;

    public $createdAt;

    public $updatedAt;

    public $shipmentStatus;

    public $statusDetails;

    public $isInOneHolder;

    public $packed;

    public $target;

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

    public $status;

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    public $isExternalWarehouse;

    public $clientUsername;

    public $clientUserImage;

    public $trackCreatedByUser;

    public $trackCreatedByUserImage;

    public $trackUpdatedByUser;

    public $trackUpdatedByUserImage;

    public $shipmentStatusCreatedByUser;

    public $shipmentStatusCreatedByUserImage;

    public $shipmentStatusUpdatedByUser;

    public $shipmentStatusUpdatedByUserImage;

}