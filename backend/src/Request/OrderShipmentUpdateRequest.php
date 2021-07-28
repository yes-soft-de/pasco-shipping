<?php

namespace App\Request;

class OrderShipmentUpdateRequest
{
    private $id;

    private $transportationType;

    private $target;

    private $supplierID;

    private $supplierName;

    private $quantity;

    private $image;

    private $productCategoryID;

    private $unit;

    private $receiverName;

    private $receiverPhoneNumber;

    private $paymentTime;

    private $vehicleIdentificationNumber;

    private $extraSpecification;

    private $distributorID;

    private $exportWarehouseID;

    private $importWarehouseID;

    private $packetingBy;

    private $markID;

    private $weight;

    private $qrCode;

    private $guniQuantity;

    private $updatedBy;

    /**
     * Following fields are for Shipment Status entity
     */
    private $shipmentID;

    private $trackNumber;

    private $shipmentStatus;

    private $statusDetails;

    // external warehouse info
    private $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    private $isExternalWarehouse;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

    public function getUpdatedBy()
    {
        return $this->updatedBy;
    }

    public function setShipmentStatus($status)
    {
        $this->shipmentStatus = $status;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

}