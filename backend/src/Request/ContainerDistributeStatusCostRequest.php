<?php

namespace App\Request;

class ContainerDistributeStatusCostRequest
{
    private $containerID;

    private $status;

    private $currency;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function getContainerID()
    {
        return $this->containerID;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getCurrency()
    {
        return $this->currency;
    }

}