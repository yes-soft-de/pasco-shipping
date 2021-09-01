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

    private $carrierID;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }
    
    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
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