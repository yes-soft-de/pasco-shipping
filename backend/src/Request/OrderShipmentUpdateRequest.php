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

    private $weight;

    private $qrCode;

    private $guniQuantity;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}