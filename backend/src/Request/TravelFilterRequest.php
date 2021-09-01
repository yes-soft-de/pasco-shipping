<?php

namespace App\Request;

class TravelFilterRequest
{
    private $type;

    private $launchCountry;

    private $destinationCountry;

    private $launchDate;

    private $arrivalDate;

    private $travelNumber;

    private $shipperID;

    private $carrierID;

    private $status;

    public function getType()
    {
        return $this->type;
    }

    public function getLaunchCountry()
    {
        return $this->launchCountry;
    }

    public function getDestinationCountry()
    {
        return $this->destinationCountry;
    }

    public function getLaunchDate()
    {
        return $this->launchDate;
    }

    public function getArrivalDate()
    {
        return $this->arrivalDate;
    }

    public function getTravelNumber()
    {
        return $this->travelNumber;
    }

    public function getShipperID()
    {
        return $this->shipperID;
    }

    public function getCarrierID()
    {
        return $this->carrierID;
    }

    public function getStatus()
    {
        return $this->status;
    }

}