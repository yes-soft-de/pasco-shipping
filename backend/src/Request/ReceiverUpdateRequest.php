<?php

namespace App\Request;

class ReceiverUpdateRequest
{
    private $id;

    private $fullName;

    private $phone;

    private $email;

    private $address;

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