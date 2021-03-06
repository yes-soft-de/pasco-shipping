<?php

namespace App\Request;

class AirwaybillUpdateRequest
{
    private $id;

    private $specificationID;

    private $airwaybillNumber;

    private $status;

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