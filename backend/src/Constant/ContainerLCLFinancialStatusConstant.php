<?php

namespace App\Constant;

class ContainerLCLFinancialStatusConstant
{
    /**
     * Define the financial status that an LCL container may afford
     */
    static  $LCL_CONTAINER_FINANCIAL_STATUS_ARRAY = [
        "shipping", "uploading", "fork", "clearance", "buyingCost", "other"
    ];

}