<?php

namespace App\Request;

class OrderShipmentCreateRequest
{
    private $clientUserID;

    private $transportationType;

    private $target;

    private $supplierID;

    private $distributorID;

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

    private $status = "waiting";

    private $createdBy;

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}