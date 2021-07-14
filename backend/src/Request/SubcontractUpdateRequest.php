<?php

namespace App\Request;

class SubcontractUpdateRequest
{
    private $id;

    private $fullName;

    private $phone;

    private $serviceID;

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