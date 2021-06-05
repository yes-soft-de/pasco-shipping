<?php

namespace App\Request;

class TravelStatusUpdateRequest
{
    private $id;

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

}