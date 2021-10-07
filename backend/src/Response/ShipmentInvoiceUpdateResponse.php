<?php

namespace App\Response;

class ShipmentInvoiceUpdateResponse
{
    public $id;

    public $shipmentID;

    public $createdAt;

    public $updatedAt;

    public $paymentStatus;

    public $paymentDate;

    public $paidBy;

    public $paidOnBehalfBy;

    public $invoiceImage;

    public $receiptImage;

    public $totalCost;

    public $discount;

    public $notes;

    public $billDetails;

}