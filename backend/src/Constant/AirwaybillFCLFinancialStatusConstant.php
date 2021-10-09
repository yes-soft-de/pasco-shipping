<?php

namespace App\Constant;

class AirwaybillFCLFinancialStatusConstant
{
    /**
     * Define the financial status that an FCL air waybill may afford
     * either for local or external warehouse
     */
    static  $FCL_AIR_WAYBILL_FINANCIAL_STATUS_ARRAY = [
        "transporting", "delayed", "shipping", "uploading", "fork", "clearance", "buyingCost", "sellingCost", "other"
    ];

    /**
     * Specific finance status that could display for the client
     */
    static $FCL_AIR_WAYBILL_BILL_DETAILS = [
        "transporting", "delayed", "shipping", "uploading", "fork", "clearance", "sellingCost", "other"
    ];

}