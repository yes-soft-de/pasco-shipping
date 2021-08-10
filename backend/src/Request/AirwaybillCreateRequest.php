<?php

namespace App\Request;

class AirwaybillCreateRequest
{
    private $specificationID;

    private $airwaybillNumber;

    private $status;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    private $carrierID;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}