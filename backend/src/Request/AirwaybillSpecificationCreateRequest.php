<?php

namespace App\Request;

class AirwaybillSpecificationCreateRequest
{
    private $type;

    private $providedBy;

    private $weight;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}