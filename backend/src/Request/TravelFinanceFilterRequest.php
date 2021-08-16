<?php

namespace App\Request;

class TravelFinanceFilterRequest
{
    private $travelID;

    private $status;

    public function getTravelID()
    {
        return $this->travelID;
    }

    public function getStatus()
    {
        return $this->status;
    }
    
}
