<?php

namespace App\Request;

class ShipmentLCLFinanceCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $stageDescription;

    private $stageCost;

    private $shipmentStatus;

    private $currency;

    private $holderType;

    private $holderID;

    private $subcontractID;

    private $paymentType;

    private $chequeNumber;

    private $proxyID;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

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

    public function setShipmentStatus($shipmentStatus)
    {
        $this->shipmentStatus = $shipmentStatus;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

    public function setCurrency($currency)
    {
        $this->currency = $currency;
    }

    public function setStageDescription($stageDescription)
    {
        $this->stageDescription = $stageDescription;
    }

    public function setStageCost($stageCost)
    {
        $this->stageCost = $stageCost;
    }

    public function setHolderType($holderType)
    {
        $this->holderType = $holderType;
    }

    public function getHolderType()
    {
        return $this->holderType;
    }

    public function setHolderID($holderID)
    {
        $this->holderID = $holderID;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

}