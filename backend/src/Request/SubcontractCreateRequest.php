<?php

namespace App\Request;

class SubcontractCreateRequest
{
    private $fullName;

    private $phone;

    private $serviceID;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}