<?php

namespace App\Request;

class MessageCreateRequest
{
    private $roomID;

    private $userOneID;

    private $userTwoID;

    public function setRoomID($roomID)
    {
        $this->roomID = $roomID;
    }

    public function setUserOneID($userOneID)
    {
        $this->userOneID = $userOneID;
    }

    public function getUserOneID()
    {
        return $this->userOneID;
    }

    public function setUserTwoID($userTwoID)
    {
        $this->userTwoID = $userTwoID;
    }

    public function getUserTwoID()
    {
        return $this->userTwoID;
    }

}