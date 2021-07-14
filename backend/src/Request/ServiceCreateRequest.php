<?php

namespace App\Request;

class ServiceCreateRequest
{
    private $name;

    private $description;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }
    
}