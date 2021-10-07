<?php

namespace App\Response;

class ShipmentInvoiceCreateResponse
{
    public $id;

    public $shipmentID;

    public $createdAt;

    public $createdBy;

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