<?php

namespace App\Request;

class ClientUpdatePasswordByDashboardRequest
{
    private $id;

    private $password;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }
    
}
