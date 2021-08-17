<?php

namespace App\Request;

class ReceiverFilterRequest
{
    private $clientUserID;

    private $createdBy;

    public function getClientUserID()
    {
        return $this->clientUserID;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }
    
}