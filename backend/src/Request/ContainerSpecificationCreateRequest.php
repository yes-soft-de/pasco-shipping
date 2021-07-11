<?php

namespace App\Request;

class ContainerSpecificationCreateRequest
{
    private $capacityCPM;

    private $widthInMeter;

    private $hightInMeter;

    private $lengthInMeter;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}