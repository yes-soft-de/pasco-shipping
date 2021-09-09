<?php

namespace App\Request;

class PendingHolderCreateRequest
{
    private $shipmentID;

    private $specificationID;

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

}