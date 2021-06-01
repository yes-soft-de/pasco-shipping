<?php

namespace App\Request;

class ContainerCreateRequest
{
    private $specificationID;

    private $containerNumber;

    private $status = "waiting";

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}