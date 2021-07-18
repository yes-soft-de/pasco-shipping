<?php

namespace App\Request;

class TrackUpdateByHolderTypeAndIdRequest
{
    private $travelID;

    private $holderID;

    private $holderType;

    private $shipmentStatus;

    private $updatedBy;

    public function getHolderType()
    {
        return $this->holderType;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

    public function getUpdatedBy()
    {
        return $this->updatedBy;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

}