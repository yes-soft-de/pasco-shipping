<?php

namespace App\Request;

class ChatStateUpdateRequest
{
    private $id;

    private $state;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy): void
    {
        $this->updatedBy = $updatedBy;
    }

}