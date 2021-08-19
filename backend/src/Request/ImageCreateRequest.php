<?php

namespace App\Request;

class ImageCreateRequest
{
    private $image;

    private $shipmentID;

    private $specialLink;

    public function setImage($image)
    {
        $this->image = $image;
    }

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

}