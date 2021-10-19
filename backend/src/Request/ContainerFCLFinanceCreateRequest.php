<?php

namespace App\Request;

class ContainerFCLFinanceCreateRequest
{
    private $containerID;

    private $stageDescription;

    private $stageCost;

    private $sellingCost;

    private $buyingCost;

    private $status;

    private $currency;

    private $subcontractID;

    private $paymentType;

    private $chequeNumber;

    private $proxyID;

    private $createdBy;

    public function getContainerID()
    {
        return $this->containerID;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function setContainerID($containerID)
    {
        $this->containerID = $containerID;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getStageCost()
    {
        return $this->stageCost;
    }

    public function getSellingCost()
    {
        return $this->sellingCost;
    }

}