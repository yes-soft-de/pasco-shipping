<?php

namespace App\Request;

class ShipmentLogCreateRequest
{
    private $shipmentID;

    private $shipmentStatus;

    private $trackNumber;

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setShipmentStatus($shipmentStatus)
    {
        $this->shipmentStatus = $shipmentStatus;
    }

    public function setTrackNumber($trackNumber)
    {
        $this->trackNumber = $trackNumber;
    }

}