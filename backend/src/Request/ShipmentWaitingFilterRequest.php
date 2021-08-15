<?php

namespace App\Request;

class ShipmentWaitingFilterRequest
{
    private $transportationType;

    private $isExternalWarehouse;

    private $exportWarehouseName;

    private $paymentTime;

    public function getTransportationType()
    {
        return $this->transportationType;
    }

    public function getIsExternalWarehouse()
    {
        return $this->isExternalWarehouse;
    }

    public function getExportWarehouseName()
    {
        return $this->exportWarehouseName;
    }

    public function getPaymentTime()
    {
        return $this->paymentTime;
    }

}