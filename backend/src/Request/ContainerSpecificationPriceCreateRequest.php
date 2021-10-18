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

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}