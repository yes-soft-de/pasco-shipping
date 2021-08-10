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

    public $createdAt;

    public $updatedAt;

    public $productCategoryName;

    public $unit;

    public $receiverName;

    public $receiverPhoneNumber;

    public $markNumber;

    public $packetingBy;

    public $paymentTime;

    public $weight;

    public $qrCode;

    public $guniQuantity;

    public $vehicleIdentificationNumber;

    public $extraSpecification;

    public $status;

    public $tracks = [];

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    public $isExternalWarehouse;

    public $orderUpdatedByUser;

    public $orderUpdatedByUserImage;

}