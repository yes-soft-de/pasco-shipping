<?php

namespace App\Request;

class AirwaybillSpecificationCreateRequest
{
    private $weight;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}