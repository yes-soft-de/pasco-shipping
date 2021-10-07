<?php

namespace App\Constant;

class ShipmentLCLFinancialStatusConstant
{
    /**
     * Define the financial status that an LCL shipment may afford
     */
    static $LCL_SHIPMENT_FINANCIAL_STATUS_ARRAY = [
        "transporting", "delayed", "shipping", "uploading", "fork", "pocketing", "other"
    ];

    /**
     * Specific finance status that could display for the client
     */
    static $LCL_SHIPMENT_BILL_DETAILS = [
        "transporting", "delayed", "shipping", "uploading", "fork", "pocketing", "other"
    ];

}