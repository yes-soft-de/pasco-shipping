<?php

namespace App\Request;

class WarehouseCreateRequest
{
    private $name;

    private $subcontractID;

    private $countryID;

    private $city;

    private $location;

    private $createdBy;

    private $rentingFee;

    private $proxyID;

    private $type;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function getCountryID()
    {
        return $this->countryID;
    }

    public function getCity()
    {
        return $this->city;
    }

}