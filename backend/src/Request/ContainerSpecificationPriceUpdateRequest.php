<?php

namespace App\Request;

class ContainerSpecificationPriceUpdateRequest
{
    private $id;

    private $containerSpecificationID;

    private $exportCountryID;

    private $exportCity;

    private $destinationPortID;

    private $price;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id): void
    {
        $this->id = $id;
    }

    public function setPrice($price): void
    {
        $this->price = $price;
    }

    public function setUpdatedBy($updatedBy): void
    {
        $this->updatedBy = $updatedBy;
    }

}