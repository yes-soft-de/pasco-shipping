<?php

namespace App\Request;

class ShipmentFinanceCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $stageDescription;

    private $stageCost;

    private $shipmentStatus;

    private $currency;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

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

    public function setStageCost($stageCost)
    {
        $this->stageCost = $stageCost;
    }

}