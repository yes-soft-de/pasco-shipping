<?php

namespace App\Request;

class PriceUpdateRequest
{
    private $id;

    private $oneKiloPrice;

    private $oneCBMPrice;

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