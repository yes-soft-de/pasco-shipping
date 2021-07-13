<?php

namespace App\Request;

class ServiceUpdateRequest
{
    private $id;

    private $name;

    private $description;

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