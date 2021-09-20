<?php

namespace App\Request;

class WarehouseFilterRequest
{
    private $typeOfCountry;

    private $cityName;

    private $countryID;

    /**
     * refers to the city name
     * Used this for get all warehouses in the country which the city exists in
     */
    private $target;

    private $countriesIDs;

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

    public function getTarget()
    {
        return $this->target;
    }

    public function getCountriesIDs()
    {
        return $this->countriesIDs;
    }

    public function setCountriesIDs($countriesIDs)
    {
        $this->countriesIDs = $countriesIDs;
    }

}