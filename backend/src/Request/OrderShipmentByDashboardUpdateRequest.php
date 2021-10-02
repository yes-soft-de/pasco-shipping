<?php

namespace App\Request;

class OrderShipmentByDashboardUpdateRequest
{
    private $id;

    private $importWarehouseID;

    private $distributorID;

    private $subProductCategoryID;

    private $unit;

    private $markID;

    private $paymentTime;

    private $vehicleIdentificationNumber;

    private $extraSpecification;

    private $receiverID;

    private $images;

    private $updatedBy;

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

    public function getImages()
    {
        return $this->images;
    }

}