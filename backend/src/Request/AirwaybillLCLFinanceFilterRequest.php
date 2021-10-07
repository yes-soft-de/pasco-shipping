<?php

namespace App\Request;

class AirwaybillLCLFinanceFilterRequest
{
    private $airwaybillID;

    private $status;

    public function getAirwaybillID()
    {
        return $this->airwaybillID;
    }

    public function getStatus()
    {
        return $this->status;
    }

}