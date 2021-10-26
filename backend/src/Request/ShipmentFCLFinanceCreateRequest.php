<?php

namespace App\Request;

class ShipmentFCLFinanceCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $stageDescription;

    private $stageCost;

    private $shipmentStatus;

    private $currency;

    private $subcontractID;

    private $paymentType;

    private $chequeNumber;

    private $proxyID;

    private $importWarehouseID;

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

}