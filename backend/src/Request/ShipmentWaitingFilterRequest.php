<?php

namespace App\Request;

class ShipmentWaitingFilterRequest
{
    private $transportationType;

    private $isExternalWarehouse;

    private $exportWarehouseID;

    private $paymentTime;

    public function getTransportationType()
    {
        return $this->transportationType;
    }

    public function getIsExternalWarehouse()
    {
        return $this->isExternalWarehouse;
    }

    public function getExportWarehouseID()
    {
        return $this->exportWarehouseID;
    }

    public function getPaymentTime()
    {
        return $this->paymentTime;
    }

}