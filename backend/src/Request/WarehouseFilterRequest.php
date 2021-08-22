<?php

namespace App\Request;

class WarehouseFilterRequest
{
    private $typeOfCountry;

    private $cityName;

    public function getTypeOfCountry()
    {
        return $this->typeOfCountry;
    }

    public function getCityName()
    {
        return $this->cityName;
    }

}