<?php

namespace App\Response;

class ShipmentStatusGetResponse
{
    public $id;

    public $shipmentID;

    public $shipmentStatus;

    public $trackNumber;

    public $statusDetails;

    public $isInOneHolder;

    public $packed;

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

    // external warehouse info
    public $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    public $isExternalWarehouse;

    public $clientUsername;

    public $clientUserImage;

    public $orderUpdatedByUser;

    public $orderUpdatedByUserImage;

    public $shipmentStatusCreatedByUser;

    public $shipmentStatusCreatedByUserImage;

    public $shipmentStatusUpdatedByUser;

    public $shipmentStatusUpdatedByUserImage;

}