<?php

namespace App\Request;

class ShipmentFilterRequest
{
    private $status;

    private $transportationType;

    private $trackNumber;

    private $paymentTime;

    private $launchCountry;

    private $targetCountry;

    private $isExternalWarehouse;

    private $exportWarehouseName;

    private $importWarehouseName;

    public function getStatus()
    {
        return $this->status;
    }

    public function getTransportationType()
    {
        return $this->transportationType;
    }

    public function getPaymentTime()
    {
        return $this->paymentTime;
    }

    public function getExportWarehouseName()
    {
        return $this->exportWarehouseName;
    }

    public function getLaunchCountry()
    {
        return $this->launchCountry;
    }

    public function getTargetCountry()
    {
        return $this->targetCountry;
    }

    public function getTrackNumber()
    {
        return $this->trackNumber;
    }

    public function getIsExternalWarehouse()
    {
        return $this->isExternalWarehouse;
    }

    public function getImportWarehouseName()
    {
        return $this->importWarehouseName;
    }

}