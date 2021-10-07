<?php

namespace App\Constant;

class AirwaybillLCLFinancialStatusConstant
{
    /**
     * Define the financial status that an LCL air waybill may afford
     */
    static  $LCL_AIRWAYBILL_FINANCIAL_STATUS_ARRAY = [
        "shipping", "uploading", "fork", "clearance", "buyingCost", "other"
    ];

}