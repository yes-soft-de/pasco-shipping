<?php

namespace App\Request;

class CountryUpdateRequest
{
    private $id;

    private $name;

    // import | export
    private $type;

    private $callingCode;

    private $updatedBy;

    public function getId()
    {
        return $this->id;
    }
    
    public function setUpdatedBy($updatedBy)
    {
        $this->updatedBy = $updatedBy;
    }

}