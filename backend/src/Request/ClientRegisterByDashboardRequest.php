<?php

namespace App\Request;

class ClientRegisterByDashboardRequest
{
    private $userID;

    private $roles = [];

    private $email;

    private $createdBy;

    private $userName;

    private $image;

    private $city;

    private $country;

    private $location;

    private $phone;

    public function getUserID()
    {
        return $this->userID;
    }

    public function setUserID($userID)
    {
        $this->userID = $userID;
    }

    public function getRoles()
    {
        return $this->roles;
    }

    public function setRoles(array $roles)
    {
        $this->roles = $roles;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}
