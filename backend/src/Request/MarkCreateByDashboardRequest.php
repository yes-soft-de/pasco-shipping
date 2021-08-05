<?php

namespace App\Request;

class MarkCreateByDashboardRequest
{
    private $clientUserID;

    private $markNumber;

    private $createdBy;

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function getMarkNumber()
    {
        return $this->markNumber;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}