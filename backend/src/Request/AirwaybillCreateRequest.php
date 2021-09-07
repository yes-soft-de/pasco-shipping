<?php

namespace App\Request;

class AirwaybillCreateRequest
{
    private $specificationID;

    private $airwaybillNumber;

    private $status;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    private $carrierID;

    private $createdBy;

    private $shipmentID;

    public function setType($type)
    {
        $this->type = $type;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setSpecificationID($specificationID)
    {
        $this->specificationID = $specificationID;
    }

}