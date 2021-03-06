<?php

namespace App\Request;

class ShipmentFilterRequest
{
    private $status;

    private $transportationType;

    private $paymentTime;

    private $createdAt;

    private $finishedAt;

    private $launchCountry;

    private $targetCountry;

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

    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    public function getFinishedAt()
    {
        return $this->finishedAt;
    }

    public function getLaunchCountry()
    {
        return $this->launchCountry;
    }

    public function getTargetCountry()
    {
        return $this->targetCountry;
    }

}