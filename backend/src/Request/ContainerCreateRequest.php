<?php

namespace App\Request;

class ContainerCreateRequest
{
    private $specificationID;

    private $containerNumber;

    private $status;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    private $createdBy;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}