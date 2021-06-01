<?php

namespace App\Request;

class ShipmentOrderStatusUpdateRequest
{
    private $id;

    private $status;

    private $updatedBy;
    
    public function getId()
    {
        return $this->id;
    }
    
    public function getStatus()
    {
        return $this->status;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }
    
    public function getUpdatedBy()
    {
        return $this->updatedBy;
    }
    
}