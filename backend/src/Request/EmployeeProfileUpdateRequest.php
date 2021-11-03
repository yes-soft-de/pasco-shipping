<?php

namespace App\Request;

class EmployeeProfileUpdateRequest
{
    private $id;

    private $userID;

    private $userName;

    private $phone;

    private $image;

    public function getId()
    {
        return $this->id;
    }

    public function setUserID($userID)
    {
        $this->userID = $userID;
    }

    public function getUserID()
    {
        return $this->userID;
    }

}