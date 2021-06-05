<?php

namespace App\Request;

class SubcontractUpdateRequest
{
    private $id;

    private $fullName;

    private $phone;

    private $serviceType;

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