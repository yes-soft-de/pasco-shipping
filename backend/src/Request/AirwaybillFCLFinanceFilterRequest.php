<?php

namespace App\Request;

class AirwaybillFCLFinanceFilterRequest
{
    private $airwaybillID;

    private $status;

    private $purchaseBill;

    public function setAirwaybillID($airwaybillID)
    {
        $this->airwaybillID = $airwaybillID;
    }

    public function getAirwaybillID()
    {
        return $this->airwaybillID;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getPurchaseBill()
    {
        return $this->purchaseBill;
    }

}