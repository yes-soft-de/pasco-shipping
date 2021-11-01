<?php

namespace App\Request;

class AirwaybillShipmentIdUpdateRequest
{
    private $id;

    private $shipmentID;

    public function getId()
    {
        return $this->id;
    }

}