<?php

namespace App\Request;

class ContainerFCLFinanceFilterRequest
{
    private $containerID;

    private $status;

    private $purchaseBill;

    public function getContainerID()
    {
        return $this->containerID;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getPurchaseBill()
    {
        return $this->purchaseBill;
    }

}