<?php

namespace App\Request;

class CountryCreateRequest
{
    private $name;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}