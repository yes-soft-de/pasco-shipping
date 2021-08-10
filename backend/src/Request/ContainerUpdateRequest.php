<?php

namespace App\Request;

class ContainerUpdateRequest
{
    private $id;

    private $specificationID;

    private $containerNumber;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    private $carrierID;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}