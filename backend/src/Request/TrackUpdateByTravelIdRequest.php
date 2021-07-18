<?php

namespace App\Request;

class TrackUpdateByTravelIdRequest
{
    private $travelID;

    private $shipmentStatus;

    private $updatedBy;

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

    public function getUpdatedBy()
    {
        return $this->updatedBy;
    }

    public function setTravelID($travelID)
    {
        $this->travelID = $travelID;
    }

    public function getTravelID()
    {
        return $this->travelID;
    }

    public function setShipmentStatus($shipmentStatus)
    {
        $this->shipmentStatus = $shipmentStatus;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

}