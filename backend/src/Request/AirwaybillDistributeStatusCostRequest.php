<?php

namespace App\Request;

class AirwaybillDistributeStatusCostRequest
{
    private $airwaybillID;

    private $status;

    private $currency;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function getAirwaybillID()
    {
        return $this->airwaybillID;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getCurrency()
    {
        return $this->currency;
    }

}