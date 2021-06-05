<?php

namespace App\Request;

class ProxyCreateRequest
{
    private $fullName;

    private $phone;

    private $address;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}