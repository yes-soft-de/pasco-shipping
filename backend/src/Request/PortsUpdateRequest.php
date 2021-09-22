<?php

namespace App\Request;

class PortsUpdateRequest
{
    private $id;

    private $name;

    private $countryID;

    private $location;

    private $city;

    private $updatedBy;

    private $type;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}