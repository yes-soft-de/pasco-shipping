<?php

namespace App\Request;

class ContainerLCLFinanceCreateRequest
{
    private $containerID;

    private $stageDescription;

    private $stageCost;

    private $status;

    private $currency;

    private $subcontractID;

    private $importWarehouseID;

    private $paymentType;

    private $chequeNumber;

    private $financialFundName;

    private $createdBy;

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

}