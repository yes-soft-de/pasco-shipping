<?php

namespace App\Request;

class AirwaybillLCLFinanceCreateRequest
{
    private $airwaybillID;

    private $stageDescription;

    private $stageCost;

    private $status;

    private $currency;

    private $subcontractID;

    private $importWarehouseID;

    private $paymentType;

    private $chequeNumber;

    private $financialFundName;

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