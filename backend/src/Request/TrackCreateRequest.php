<?php

namespace App\Request;

class TrackCreateRequest
{
    private $shipmentID;

    private $holderType;

    private $holderID;

    private $createdBy;

    private $trackNumber;

    private $shipmentStatus;

    private $statusDetails;

    private $isInOneHolder;

    private $packed;

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

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function setHolderType($holderType)
    {
        $this->holderType = $holderType;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

    public function setHolderID($holderID)
    {
        $this->holderID = $holderID;
    }

}