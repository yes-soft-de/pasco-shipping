<?php

namespace App\Request;

class TravelCreateRequest
{
    private $type;

    private $launchCountry;

    private $destinationCountry;

    private $launchDate;

    private $arrivalDate;

    private $travelNumber;

    private $shipperID;

    private $createdBy;

    private $status;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function getLaunchDate()
    {
        return $this->launchDate;
    }

    public function getArrivalDate()
    {
        return $this->arrivalDate;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

}