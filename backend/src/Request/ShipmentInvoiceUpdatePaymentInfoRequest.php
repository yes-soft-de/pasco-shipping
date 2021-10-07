<?php

namespace App\Request;

class ShipmentInvoiceUpdatePaymentInfoRequest
{
    private $id;

    private $paymentStatus;

    private $paymentDate;

    private $paidBy;

    private $paidOnBehalfBy;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function getPaymentDate()
    {
        return $this->paymentDate;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}