<?php

namespace App\Request;

class WarehouseUpdateRequest
{
    private $id;

    private $name;

    private $subcontractID;

    private $countryID;

    private $city;

    private $location;

    private $updatedBy;

    private $rentingFee;

    private $proxyID;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}