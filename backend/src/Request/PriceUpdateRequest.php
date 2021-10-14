<?php

namespace App\Request;

class PriceUpdateRequest
{
    private $id;

    private $oneKiloPrice;

    private $oneCBMPrice;

    private $exportCountryID;

    private $exportCity;

    private $importCountryID;

    private $importCity;

    private $containerSpecificationID;

    private $containerSpecificationPrice;

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

    public function getContainerSpecificationID()
    {
        return $this->containerSpecificationID;
    }

    public function getContainerSpecificationPrice()
    {
        return $this->containerSpecificationPrice;
    }

}