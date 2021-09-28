<?php

namespace App\Request;

class AirwaybillShippingStatusUpdateRequest
{
    private $id;

    private $shippingStatus;

    private $updatedBy;

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setShippingStatus($shippingStatus)
    {
        $this->shippingStatus = $shippingStatus;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}