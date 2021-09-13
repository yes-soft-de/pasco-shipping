<?php

namespace App\Request;

class GunnyFilterRequest
{
    private $identificationNumber;

    private $status;

    public function getIdentificationNumber()
    {
        return $this->identificationNumber;
    }

    public function getStatus()
    {
        return $this->status;
    }

}