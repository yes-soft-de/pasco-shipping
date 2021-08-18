<?php

namespace App\Request;

class WarehouseFinanceFilterRequest
{
    private $warehouseID;

    public function getWarehouseID()
    {
        return $this->warehouseID;
    }

}