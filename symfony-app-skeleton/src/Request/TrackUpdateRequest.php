<?php

namespace App\Request;

class TrackUpdateRequest
{
    private $id;

    private $travelID;

    private $holderID;

    private $trackNumber;

    private $updatedBy;

    public function setTrackNumber($trackNumber)
    {
        $this->trackNumber = $trackNumber;
    }

    public function getTrackNumber()
    {
        return $this->trackNumber;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

    public function getHolderID()
    {
        return $this->holderID;
    }

}