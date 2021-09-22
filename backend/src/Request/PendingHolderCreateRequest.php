<?php

namespace App\Request;

class PendingHolderCreateRequest
{
    private $shipmentID;

    private $specificationID;

    private $carrierID;

    private $portID;

    private $location;

    private $notes;

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setSpecificationID($specificationID)
    {
        $this->specificationID = $specificationID;
    }

    public function setNotes($notes)
    {
        $this->notes = $notes;
    }

    public function setCarrierID($carrierID)
    {
        $this->carrierID = $carrierID;
    }

    public function setPortID($portID)
    {
        $this->portID = $portID;
    }

    public function setLocation($location)
    {
        $this->location = $location;
    }

}