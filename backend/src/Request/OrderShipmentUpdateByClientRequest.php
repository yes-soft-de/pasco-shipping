<?php

namespace App\Request;

class OrderShipmentUpdateByClientRequest
{
    private $id;

    private $transportationType;

    private $target;

    private $supplierID;

    private $supplierName;

    private $markID;

    private $exportWarehouseID;

    private $quantity;

    private $image;

    private $productCategoryID;

    private $unit;

    private $receiverName;

    private $receiverPhoneNumber;

    private $receiverID;

    private $paymentTime;

    private $vehicleIdentificationNumber;

    private $extraSpecification;

    private $updatedBy;

    // public | private
    private $holderType;

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

}