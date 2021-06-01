<?php

namespace App\Request;

class ShipmentStatusCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $shipmentStatus;

    private $statusDetails;

    private $isInOneHolder;

    private $packed;

    private $createdBy;

    //the following properties are used when the shipment is stored in second container for different travel
    private $holderType;

    private $holderID;

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setTrackNumber($trackNumber)
    {
        $this->trackNumber = $trackNumber;
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

    public function getHolderID()
    {
        return $this->holderID;
    }

    public function getHolderType()
    {
        return $this->holderType;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

}