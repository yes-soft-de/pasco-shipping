<?php

namespace App\Request;

class ShipmentStatusOfHolderUpdateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $shipmentStatus;

    private $updatedBy;

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function getShipmentID()
    {
        return $this->shipmentID;
    }

    public function setTrackNumber($trackNumber)
    {
        $this->trackNumber = $trackNumber;
    }

    public function getTrackNumber()
    {
        return $this->trackNumber;
    }

    public function setShipmentStatus($shipmentStatus)
    {
        $this->shipmentStatus = $shipmentStatus;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

}