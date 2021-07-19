<?php

namespace App\Request;

class TravelUpdateRequest
{
    private $id;

    private $type;

    private $launchCountry;

    private $destinationCountry;

    private $launchDate;

    private $arrivalDate;

    private $travelNumber;

    private $shipperID;

    private $updatedBy;

    private $status;

    public function getId()
    {
        return $this->id;
    }
    
    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getLaunchDate()
    {
        return $this->launchDate;
    }

    public function getArrivalDate()
    {
        return $this->arrivalDate;
    }

}