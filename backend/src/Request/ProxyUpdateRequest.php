<?php

namespace App\Request;

class ProxyUpdateRequest
{
    private $id;

    private $fullName;

    private $phone;

    private $address;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

}