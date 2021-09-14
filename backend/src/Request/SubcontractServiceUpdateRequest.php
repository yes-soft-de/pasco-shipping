<?php

namespace App\Request;

class SubcontractServiceUpdateRequest
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