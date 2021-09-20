<?php

namespace App\Request;

class WarehouseFilterRequest
{
    private $typeOfCountry;

    private $cityName;

    private $countryID;

    public function getTypeOfCountry()
    {
        return $this->typeOfCountry;
    }

    public function getCityName()
    {
        return $this->cityName;
    }

    public function getCountryID()
    {
        return $this->countryID;
    }

}