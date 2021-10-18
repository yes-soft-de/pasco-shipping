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

    private $portID;

    private $location;

    private $consignee;

    private $exportCountryID;

    private $exportCity;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function getContainerNumber()
    {
        return $this->containerNumber;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}