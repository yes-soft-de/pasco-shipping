<?php

namespace App\Request;

class ShipmentInvoiceFilterRequest
{
    private $shipmentID;

    private $paymentStatus;

    private $paymentDate;

    private $paidBy;

    private $createdBy;

    public function getShipmentID()
    {
        return $this->shipmentID;
    }

    public function getPaymentStatus()
    {
        return $this->paymentStatus;
    }

    public function getPaymentDate()
    {
        return $this->paymentDate;
    }

    public function getPaidBy()
    {
        return $this->paidBy;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

}