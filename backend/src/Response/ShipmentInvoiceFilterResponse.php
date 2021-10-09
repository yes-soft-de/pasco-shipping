<?php

namespace App\Response;

class ShipmentInvoiceFilterResponse
{
    public $id;

    public $shipmentID;

    public $paidByClient;

    public $clientUserName;

    public $clientUserID;

    public $clientImage;

    public $clientPhone;

    public $clientLocation;

    public $clientCity;

    public $clientCountry;

    public $clientIdentificationNumber;

    public $transportationType;

    public $target;

    public $paymentTime;

    public $createdAt;

    public $createdByUser;

    public $createdByUserImage;

    public $updatedAt;

    public $updatedByUser;

    public $updatedByUserImage;

    public $paymentStatus;

    public $paymentDate;

    // client user ID
    public $paidBy;

    public $paidOnBehalfBy;

    public $invoiceImage;

    public $receiptImage;

    public $totalCost;

    public $discount;

    public $notes;

    public $billDetails;

}