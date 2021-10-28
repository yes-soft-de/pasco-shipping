<?php

namespace App\Request;

class ContainerCreateRequest
{
    private $specificationID;

    private $containerNumber = "";

    private $status;

    private $type;

    private $providedBy = 0;

    private $shipperID;

    private $consigneeID;

    private $carrierID;

    private $createdBy;

    private $shipmentID;

    private $clientUserID;

    private $portID;

    private $exportPortID;

    private $exportCountryID;

    private $exportCity;

    private $location;

    private $exportLocation;

    public function setType($type)
    {
        $this->type = $type;
    }

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setSpecificationID($specificationID)
    {
        $this->specificationID = $specificationID;
    }

    public function setClientUserID($clientUserID)
    {
        $this->clientUserID = $clientUserID;
    }

    public function setCarrierID($carrierID): void
    {
        $this->carrierID = $carrierID;
    }

    public function setPortID($portID): void
    {
        $this->portID = $portID;
    }

    public function setLocation($location): void
    {
        $this->location = $location;
    }

    public function getContainerNumber()
    {
        return $this->containerNumber;
    }

    public function setExportCountryID($exportCountryID)
    {
        $this->exportCountryID = $exportCountryID;
    }

    public function setExportLocation($exportLocation)
    {
        $this->exportLocation = $exportLocation;
    }

    public function setExportPortID($exportPortID)
    {
        $this->exportPortID = $exportPortID;
    }

}