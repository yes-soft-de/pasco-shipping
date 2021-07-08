<?php

namespace App\Request;

class UnitUpdateRequest
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