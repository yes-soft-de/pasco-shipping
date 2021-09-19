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

    private $exportWarehouseID;

    private $importWarehouseID;

    private $dateOne;

    private $dateTwo;

    private $containerNumber;

    private $airWaybillNumber;

    private $clientUserID;

    private $measuredUntilCleared;

    private $measuredUntilArrived;

    private $acceptedUntilCleared;

    private $acceptedUntilArrived;

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

    public function getExportWarehouseID()
    {
        return $this->exportWarehouseID;
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

    public function getImportWarehouseID()
    {
        return $this->importWarehouseID;
    }

    public function getDateOne()
    {
        return $this->dateOne;
    }

    public function getDateTwo()
    {
        return $this->dateTwo;
    }

    public function getContainerNumber()
    {
        return $this->containerNumber;
    }

    public function getAirWaybillNumber()
    {
        return $this->airWaybillNumber;
    }

    public function getClientUserID()
    {
        return $this->clientUserID;
    }

    public function getMeasuredUntilCleared()
    {
        return $this->measuredUntilCleared;
    }

    public function getMeasuredUntilArrived()
    {
        return $this->measuredUntilArrived;
    }

    public function getAcceptedUntilCleared()
    {
        return $this->acceptedUntilCleared;
    }

    public function getAcceptedUntilArrived()
    {
        return $this->acceptedUntilArrived;
    }

}