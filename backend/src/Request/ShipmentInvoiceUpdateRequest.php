<?php

namespace App\Request;

class ShipmentInvoiceUpdateRequest
{
    private $id;

    private $updatedBy;

    private $invoiceImage;

    private $receiptImage;

    private $discount;

    private $notes;

    public function getId()
    {
        return $this->id;
    }

    public function getDiscount()
    {
        return $this->discount;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}