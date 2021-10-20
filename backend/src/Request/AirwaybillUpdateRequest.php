<?php

namespace App\Request;

class AirwaybillUpdateRequest
{
    private $id;

    private $specificationID;

    private $airwaybillNumber;

    private $type;

    private $providedBy;

    private $shipperID;

    private $consigneeID;

    private $carrierID;

    private $portID;

    private $location;

    private $consignee;

    private $weight;

    private $exportWarehouseID;

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