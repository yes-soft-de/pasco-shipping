<?php

namespace App\Response;

class OrderShipmentGetResponse
{
    public $id;

    public $clientUserID;

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

    public $gunny = [];

    public $tracks = [];

    public $receivingInfo;

    public $remainedQuantity;

    public $shipmentInvoiceID = 0;

    public $pendingHolders = [];

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external warehouse is used or not.
    public $isExternalWarehouse;

    public $orderUpdatedByUser;

    public $orderUpdatedByUserImage;

}