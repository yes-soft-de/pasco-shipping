<?php

namespace App\Request;

class AirwaybillFinanceCreateRequest
{
    private $airwaybillID;

    private $stageDescription;

    private $stageCost;

    private $status;

    private $currency;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function setAirwaybillID($airwaybillID)
    {
        $this->airwaybillID = $airwaybillID;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getStageCost()
    {
        return $this->stageCost;
    }

}