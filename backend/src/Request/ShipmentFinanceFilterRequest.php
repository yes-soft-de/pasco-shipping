<?php

namespace App\Request;

class ShipmentFinanceFilterRequest
{
    private $shipmentID;

    private $trackNumber;

    private $shipmentStatus;

    private $exportWarehouseID;

    private $importWarehouseID;

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

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

    public function getExportWarehouseID()
    {
        return $this->exportWarehouseID;
    }

    public function getImportWarehouseID()
    {
        return $this->importWarehouseID;
    }

}