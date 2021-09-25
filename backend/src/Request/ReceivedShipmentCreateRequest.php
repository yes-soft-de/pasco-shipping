<?php

namespace App\Request;

class ReceivedShipmentCreateRequest
{
    private $shipmentID;

    private $trackNumber;

    private $receivedQuantity;

    private $supplierID;

    private $notes;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}