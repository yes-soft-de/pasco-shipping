<?php

namespace App\Request;

class DistributorCreateRequest
{
    private $fullName;

    private $phone;

    private $address;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}