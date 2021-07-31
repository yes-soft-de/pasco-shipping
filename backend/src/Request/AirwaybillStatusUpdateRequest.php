<?php

namespace App\Request;

class AirwaybillStatusUpdateRequest
{
    private $id;

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