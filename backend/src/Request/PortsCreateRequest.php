<?php

namespace App\Request;

class PortsCreateRequest
{
    private $name;

    private $countryID;

    private $location;

    private $city;

    private $createdBy;

    private $type;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}