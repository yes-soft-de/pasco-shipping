<?php

namespace App\Request;

class SubcontractServiceCreateRequest
{
    private $name;

    private $description;

    private $createdBy;

    public function getName()
    {
        return $this->name;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }
    
}