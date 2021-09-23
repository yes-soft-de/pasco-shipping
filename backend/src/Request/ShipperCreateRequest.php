<?php

namespace App\Request;

class ShipperCreateRequest
{
    private $name;

    private $email;

    private $phone;

    private $address;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}