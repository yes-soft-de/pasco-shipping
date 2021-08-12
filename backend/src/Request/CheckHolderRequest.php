<?php

namespace App\Request;

class CheckHolderRequest
{
    private $shipmentID;

    private $holderType;

    private $holderID;

    private $trackNumber;

    private $isInOneHolder;

    private $packed;

    private $amount;

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

    public function setHolderType($holderType)
    {
        $this->holderType = $holderType;
    }

    public function getHolderType()
    {
        return $this->holderType;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

    public function setHolderID($holderID)
    {
        $this->holderID = $holderID;
    }

    public function getIsInOneHolder()
    {
        return $this->isInOneHolder;
    }

    public function getPacked()
    {
        return $this->packed;
    }

    public function getAmount()
    {
        return $this->amount;
    }

}