<?php

namespace App\Request;

class ClientProfileUpdateByDashboardRequest
{
    private $id;

    private $userName;

    private $city;

    private $phone;

    private $image;

    private $country;

    private $location;

    private $updatedBy;

    public function getID()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}
