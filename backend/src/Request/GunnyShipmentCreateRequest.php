<?php

namespace App\Request;

class GunnyShipmentCreateRequest
{
    private $gunnyID;

    private $shipmentID;

    private $trackNumber;

    private $quantity;

    // used to update the status of the gunny in Gunny entity
    private $gunnyStatus;

    private $createdBy;

    public function getGunnyID()
    {
        return $this->gunnyID;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function getGunnyStatus()
    {
        return $this->gunnyStatus;
    }

}