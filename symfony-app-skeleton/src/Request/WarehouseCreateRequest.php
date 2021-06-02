<?php

namespace App\Request;

class WarehouseCreateRequest
{
    private $type;

    private $countryID;

    private $city;

    private $location;

    private $createdBy;

    private $rentingFee;

    private $proxyID;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}