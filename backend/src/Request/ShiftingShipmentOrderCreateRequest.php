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

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}