<?php

namespace App\Request;

class PriceCreateRequest
{
    private $oneKiloPrice;

    private $oneCBMPrice;

    private $exportCountryID;

    private $exportCity;

    private $importCountryID;

    private $importCity;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}