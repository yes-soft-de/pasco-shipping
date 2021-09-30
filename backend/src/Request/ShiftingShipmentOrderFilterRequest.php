<?php

namespace App\Request;

class ShiftingShipmentOrderFilterRequest
{
    private $fromImportWarehouseID;

    private $toImportWarehouseID;

    private $status;

    public function getFromImportWarehouseID()
    {
        return $this->fromImportWarehouseID;
    }

    public function getToImportWarehouseID()
    {
        return $this->toImportWarehouseID;
    }

    public function getStatus()
    {
        return $this->status;
    }

}