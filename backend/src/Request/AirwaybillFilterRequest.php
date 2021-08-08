<?php

namespace App\Request;

class AirwaybillFilterRequest
{
    private $specificationID;

    private $airwaybillNumber;

    private $status;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    public function getSpecificationID()
    {
        return $this->specificationID;
    }

    public function getType()
    {
        return $this->type;
    }

    public function getAirwaybillNumber()
    {
        return $this->airwaybillNumber;
    }

    public function getConsigneeID()
    {
        return $this->consigneeID;
    }

    public function getProvidedBy()
    {
        return $this->providedBy;
    }

    public function getShipperID()
    {
        return $this->shipperID;
    }

    public function getStatus()
    {
        return $this->status;
    }

}