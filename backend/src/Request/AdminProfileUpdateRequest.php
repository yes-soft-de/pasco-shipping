<?php

namespace App\Request;

class AdminProfileUpdateRequest
{
    private $id;

    private $userID;

    private $userName;

    private $phone;

    private $image;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $userID
     */
    public function setUserID($userID): void
    {
        $this->userID = $userID;
    }

    /**
     * @return mixed
     */
    public function getUserID()
    {
        return $this->userID;
    }

}