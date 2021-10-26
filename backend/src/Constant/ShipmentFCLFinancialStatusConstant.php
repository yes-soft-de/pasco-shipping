<?php

namespace App\Constant;

class ShipmentFCLFinancialStatusConstant
{
    /**
     * Define the financial status that an FCL shipment may afford
     */
    static $FCL_SHIPMENT_FINANCIAL_STATUS_ARRAY = [
        "transporting", "delayed", "fork", "pocketing", "other"
    ];

    /**
     * Specific finance status that could display for the client
     */
    static $FCL_SHIPMENT_BILL_DETAILS = [
        "transporting", "delayed", "fork", "pocketing", "other"
    ];

}