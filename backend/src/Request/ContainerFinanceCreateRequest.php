<?php

namespace App\Request;

class ContainerFinanceCreateRequest
{
    private $containerID;

    private $stageDescription;

    private $stageCost;

    private $status;

    private $currency;

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

}