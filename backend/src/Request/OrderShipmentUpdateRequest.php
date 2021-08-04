<?php

namespace App\Request;

class OrderShipmentUpdateRequest
{
    private $id;

    private $importWarehouseID;

    private $packetingBy;

    private $weight;

    private $qrCode;

    private $guniQuantity;

    private $volume;

    private $updatedBy;

    /**
     * Following fields are for Shipment Status entity
     */

    private $trackNumber;

    private $shipmentStatus;

    private $statusDetails;

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

    public function setShipmentStatus($status)
    {
        $this->shipmentStatus = $status;
    }

    public function getShipmentStatus()
    {
        return $this->shipmentStatus;
    }

}