<?php

namespace App\Request;

class MarkCreateRequest
{
    private $clientUserID;

    private $markNumber;

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function getMarkNumber()
    {
        return $this->markNumber;
    }

}