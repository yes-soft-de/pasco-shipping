<?php

namespace App\Request;

class SubProductCategoryCreateRequest
{
    private $name;

    private $description;

    private $createdBy;

    private $hsCode;

    private $productCategoryID;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}