<?php

namespace App\Request;

class CountryCreateRequest
{
    private $name;

    // import | export
    private $type;

    private $createdBy;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

}