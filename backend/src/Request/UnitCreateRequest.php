<?php

namespace App\Request;

class UnitCreateRequest
{
    private $name;

    private $description;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}