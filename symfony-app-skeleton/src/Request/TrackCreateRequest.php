<?php

namespace App\Request;

class TrackCreateRequest
{
    private $shipmentID;

    private $travelID;

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

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function setHolderType($holderType)
    {
        $this->holderType = $holderType;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

}