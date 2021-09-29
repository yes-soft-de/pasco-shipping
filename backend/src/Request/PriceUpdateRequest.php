<?php

namespace App\Request;

class PriceUpdateRequest
{
    private $id;

    private $oneKiloPrice;

    private $oneCBMPrice;

    private $containerSpecifications;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

    public function getUpdatedBy()
    {
        return $this->updatedBy;
    }

    public function getContainerSpecifications()
    {
        return $this->containerSpecifications;
    }

}