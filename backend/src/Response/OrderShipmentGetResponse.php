<?php

namespace App\Response;

class OrderShipmentGetResponse
{
    public $id;

    public $clientUsername;

    public $clientUserImage;

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

    public $status;

    public $tracks = [];

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    public $isExternalWarehouse;

    public $orderUpdatedByUser;

    public $orderUpdatedByUserImage;

}