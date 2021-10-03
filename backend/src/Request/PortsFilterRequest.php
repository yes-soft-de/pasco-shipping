<?php

namespace App\Request;

class PortsFilterRequest
{
    private $name;

    private $countryID;

    private $city;

    private $type;

    public function getName()
    {
        return $this->name;
    }

    public function getCountryID()
    {
        return $this->countryID;
    }

    public function getCity()
    {
        return $this->city;
    }

    public function getType()
    {
        return $this->type;
    }

}