<?php

namespace App\Request;

class OrderShipmentByDashboardCreateRequest
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

    private $images = [];

    private $subProductCategoryID;

    private $unit;

    private $receiverName;

    private $receiverPhoneNumber;

    private $receiverID;

    private $paymentTime;

    private $vehicleIdentificationNumber;

    private $extraSpecification;

    private $status;

    private $createdBy;

    // lcl | fcl
    private $holderType;

    // external warehouse info
    private $externalWarehouseInfo;

    // indicates to whether external wharehouse is used or not.
    private $isExternalWarehouse;

    // indicates to the FCL holders requested by client to an external warehouse
    private $requestedHolders = [];

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

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @return array
     */
    public function getImages(): array
    {
        return $this->images;
    }

    public function getHolderCount()
    {
        return $this->holderCount;
    }

    public function setHolderCount($holderCount)
    {
        $this->holderCount = $holderCount;
    }

    /**
     * @return array
     */
    public function getRequestedHolders(): array
    {
        return $this->requestedHolders;
    }

}