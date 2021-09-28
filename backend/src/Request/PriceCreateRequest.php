<?php

namespace App\Request;

class PriceCreateRequest
{
    private $oneKiloPrice;

    private $oneCBMPrice;

    private $updatedBy;

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}