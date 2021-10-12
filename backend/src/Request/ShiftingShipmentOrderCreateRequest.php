<?php

namespace App\Request;

class ShiftingShipmentOrderCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $createdBy;

    private $fromImportWarehouseID;

    private $toImportWarehouseID;

    private $notes;

    public function getShipmentID()
    {
        return $this->shipmentID;
    }

    public function getTrackNumber()
    {
        return $this->trackNumber;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function setFromImportWarehouseID($fromImportWarehouseID)
    {
        $this->fromImportWarehouseID = $fromImportWarehouseID;
    }

}