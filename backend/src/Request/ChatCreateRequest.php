<?php

namespace App\Request;

class ChatCreateRequest
{
    private $roomID;

    private $userOneID;

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

}