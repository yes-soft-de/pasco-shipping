<?php

namespace App\Request;

class ProductCategoryCreateRequest
{
    private $name;

    private $description;

    private $createdBy;

    private $hsCode;

    public function setCreatedBy($userID)
    {
        $this->createdBy = $userID;
    }

}