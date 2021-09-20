<?php

namespace App\Request;

class ShipmentOrderImportWarehouseUpdateRequest
{
    private $id;

    private $importWarehouseID;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getImportWarehouseID()
    {
        return $this->importWarehouseID;
    }

    public function setImportWarehouseID($importWarehouseID)
    {
        $this->importWarehouseID = $importWarehouseID;
    }

}