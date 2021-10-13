<?php

namespace App\Request;

class AirwaybillFCLFinanceCreateRequest
{
    private $airwaybillID;

    private $stageDescription;

    private $stageCost;

    private $sellingCost;

    private $buyingCost;

    private $status;

    private $currency;

    private $subcontractID;

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

    public function getAirwaybillID()
    {
        return $this->airwaybillID;
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

    public function getSellingCost()
    {
        return $this->sellingCost;
    }

}