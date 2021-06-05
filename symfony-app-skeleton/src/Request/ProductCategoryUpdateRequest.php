<?php

namespace App\Request;

class ProductCategoryUpdateRequest
{
    private $id;

    private $name;

    private $description;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

}