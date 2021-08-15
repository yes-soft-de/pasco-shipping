<?php

namespace App\Request;

class ContainerFinanceFilterRequest
{
    private $containerID;

    private $status;

    public function getContainerID()
    {
        return $this->containerID;
    }

    public function getStatus()
    {
        return $this->status;
    }

}