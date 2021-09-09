<?php

namespace App\Response;

class WaitingShipmentFilterResponse
{
    public $id;

    public $clientUsername;

    public $clientUserImage;

    public $clientIdentificationNumber;

    public $transportationType;

    public $target;

    public $supplierID;

    public $supplierName;

    public $distributorName;

    public $exportWarehouseName;

    public $importWarehouseName;

    public $quantity;

    public $image;

    public $images = [];

    public $createdAt;

    public $updatedAt;

    public $productCategoryName;

    public $subProductCategoryName;

    public $unit;

    public $receiverName;

    public $receiverPhoneNumber;

    public $markNumber;

    public $packetingBy;

    public $paymentTime;

    public $weight;

    public $volume;

    public $qrCode;

    public $guniQuantity;

    public $vehicleIdentificationNumber;

    public $extraSpecification;

    public $holderType;

    public $holderCount;

    public $status;

    public $tracks = [];

    public $pendingHolders = [];

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external warehouse is used or not.
    public $isExternalWarehouse;

    public $orderUpdatedByUser;

    public $orderUpdatedByUserImage;

}