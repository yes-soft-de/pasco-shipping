<?php

namespace App\Request;

class OrderShipmentCreateRequest
{
    private $clientUserID;

    private $transportationType;

    private $target;

    private $supplierID;

    private $supplierName;

    private $distributorID;

    private $importWarehouseID;

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

    private $status;

    private $createdBy;

    // public | private
    private $holderType;

    // external warehouse info
    private $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    private $isExternalWarehouse;

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function getClientUserID()
    {
        return $this->clientUserID;
    }

    public function getExternalWarehouseInfo()
    {
        return $this->externalWarehouseInfo;
    }

}