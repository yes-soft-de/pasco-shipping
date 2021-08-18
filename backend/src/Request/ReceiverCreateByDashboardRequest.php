<?php

namespace App\Request;

class ReceiverCreateByDashboardRequest
{
    private $fullName;

    private $phone;

    private $email;

    private $address;

    private $clientUserID;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }
    
}