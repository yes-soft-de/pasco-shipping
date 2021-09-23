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

    private $clientUserID;

    private $portID;

    private $location;

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

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function setCarrierID($carrierID): void
    {
        $this->carrierID = $carrierID;
    }

    public function setPortID($portID): void
    {
        $this->portID = $portID;
    }

    public function setLocation($location): void
    {
        $this->location = $location;
    }

}