<?php

namespace App\Request;

class DistributorUpdateRequest
{
    private $id;

    private $fullName;

    private $phone;

    private $address;

    private $updatedBy;

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

    public function getId()
    {
        return $this->id;
    }

}