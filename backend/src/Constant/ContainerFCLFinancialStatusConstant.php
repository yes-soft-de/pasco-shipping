<?php

namespace App\Constant;

class ContainerFCLFinancialStatusConstant
{
    /**
     * Define the financial status that an FCL container may afford
     * either for local or external warehouse
     */
    static  $FCL_CONTAINER_FINANCIAL_STATUS_ARRAY = [
        "transporting", "delayed", "shipping", "uploading", "fork", "clearance", "buyingCost", "sellingCost", "other"
    ];

    /**
     * Specific finance status that could display for the client
     */
    static $FCL_CONTAINER_BILL_DETAILS = [
        "transporting", "delayed", "shipping", "uploading", "fork", "clearance", "sellingCost", "other"
    ];

}