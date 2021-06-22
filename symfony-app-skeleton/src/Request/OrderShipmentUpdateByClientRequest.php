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

    private $paymentTime;

    private $vehicleIdentificationNumber;

    private $extraSpecification;

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