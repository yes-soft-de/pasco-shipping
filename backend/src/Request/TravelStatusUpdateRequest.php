<?php

namespace App\Request;

class TravelStatusUpdateRequest
{
    private $id;

    private $updatedBy;

    private $status;

    private $launchDate;

    private $arrivalDate;

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