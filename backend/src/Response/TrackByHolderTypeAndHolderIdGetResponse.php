<?php

namespace App\Response;

class TrackByHolderTypeAndHolderIdGetResponse
{
    public $id;

    public $shipmentID;

    public $shipmentStatus;

    public $clientUsername;

    public $categoriesNames;

    public $trackNumber;

    public $statusDetails;

    public $isInOneHolder;

    public $packed;

    public $travelID;

    public $travelStatus;

    public $transportationType;

    public $target;

    public $supplierName;

    public $distributorName;

    public $exportWarehouseName;

    public $importWarehouseName;

    public $quantity;

    public $image;

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

    public $status;

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external warehouse is used or not.
    public $isExternalWarehouse;

    public $receivedShipmentQuantity;

}