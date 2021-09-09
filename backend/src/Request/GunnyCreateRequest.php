<?php

namespace App\Request;

class GunnyCreateRequest
{
    private $identificationNumber;

    private $createdBy;

    public function setIdentificationNumber($identificationNumber)
    {
        $this->identificationNumber = $identificationNumber;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}