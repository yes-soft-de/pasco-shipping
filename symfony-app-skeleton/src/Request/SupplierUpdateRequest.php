<?php

namespace App\Request;

class SupplierUpdateRequest
{
    private $id;

    private $fullName;

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