<?php

namespace App\Request;

class ShipperUpdateRequest
{
    private $id;

    private $name;

    private $email;

    private $phone;

    private $address;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }
}