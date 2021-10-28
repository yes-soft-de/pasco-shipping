<?php

namespace App\Request;

class PendingHolderCreateRequest
{
    private $shipmentID;

    private $specificationID;

    private $carrierID;

    private $portID;

    private $exportPortID;

    private $location;

    private $notes;

    private $exportCountryID;

    public function setShipmentID($shipmentID)
    {
        $this->shipmentID = $shipmentID;
    }

    public function setSpecificationID($specificationID)
    {
        $this->specificationID = $specificationID;
    }

    public function setNotes($notes)
    {
        $this->notes = $notes;
    }

    public function setCarrierID($carrierID)
    {
        $this->carrierID = $carrierID;
    }

    public function setPortID($portID)
    {
        $this->portID = $portID;
    }

    public function setExportPortID($exportPortID)
    {
        $this->exportPortID = $exportPortID;
    }

    public function setLocation($location)
    {
        $this->location = $location;
    }

    public function getExportCountryID()
    {
        return $this->exportCountryID;
    }

    public function setExportCountryID($exportCountryID)
    {
        $this->exportCountryID = $exportCountryID;
    }

    public function setExportCity($exportCity)
    {
        $this->exportCity = $exportCity;
    }

}