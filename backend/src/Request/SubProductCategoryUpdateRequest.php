<?php

namespace App\Request;

class SubProductCategoryUpdateRequest
{
    private $id;

    private $name;

    private $description;

    private $updatedBy;

    private $hsCode;

    private $productCategoryID;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($userID)
    {
        $this->updatedBy = $userID;
    }

}