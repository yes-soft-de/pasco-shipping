<?php

namespace App\Request;

class ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest
{
    // private $id;

    private $shipmentID;

    private $trackNumber;

    private $shipmentStatus;

    private $statusDetails;

    private $isInOneHolder;

    private $packed;

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

    public function setIsInOneHolder($isInOneHolder)
    {
        $this->isInOneHolder = $isInOneHolder;
    }

    public function setPacked($packed)
    {
        $this->packed = $packed;
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