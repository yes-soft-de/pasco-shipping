<?php

namespace App\Request;

class ContainerSpecificationPriceCreateRequest
{
    private $containerSpecificationID;

    private $exportCountryID;

    private $exportCity;

    private $destinationPortID;

    private $price;

    private $createdBy;

    public function getContainerSpecificationID()
    {
        return $this->containerSpecificationID;
    }

    public function getExportCountryID()
    {
        return $this->exportCountryID;
    }

    public function getExportCity()
    {
        return $this->exportCity;
    }

    public function getDestinationPortID()
    {
        return $this->destinationPortID;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}