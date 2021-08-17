<?php

namespace App\Request;

class ReceiverCreateRequest
{
    private $fullName;

    private $phone;

    private $email;

    private $address;

    private $clientUserID;

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }
    
}