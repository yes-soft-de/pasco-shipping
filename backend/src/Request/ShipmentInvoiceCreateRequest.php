<?php

namespace App\Request;

class ShipmentInvoiceCreateRequest
{
    private $shipmentID;

    private $createdBy;

    private $paymentStatus;

    private $paymentDate;

    private $paidBy;

    private $paidOnBehalfBy;

    private $invoiceImage;

    private $receiptImage;

    private $totalCost;

    private $discount;

    private $notes;

    private $billDetails;

    public function getShipmentID()
    {
        return $this->shipmentID;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function setPaymentStatus($paymentStatus)
    {
        $this->paymentStatus = $paymentStatus;
    }

    public function getDiscount()
    {
        return $this->discount;
    }

}