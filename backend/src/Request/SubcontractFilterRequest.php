<?php

namespace App\Request;

class SubcontractFilterRequest
{
    private $fullName;

    private $serviceID;

    private $serviceName;

    public function getFullName()
    {
        return $this->fullName;
    }

    public function getServiceID()
    {
        return $this->serviceID;
    }

    public function getServiceName()
    {
        return $this->serviceName;
    }

}