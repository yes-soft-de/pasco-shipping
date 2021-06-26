<?php

namespace App\Request;

class SupplierCreateRequest
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