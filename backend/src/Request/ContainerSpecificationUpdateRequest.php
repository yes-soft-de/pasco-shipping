<?php

namespace App\Request;

class ContainerSpecificationUpdateRequest
{
    private $id;

    private $price;

    private $updatedBy;

    private $name;

    private $capacityCPM;

    private $widthInMeter;

    private $hightInMeter;

    private $lengthInMeter;

    public function getId()
    {
        return $this->id;
    }

    public function setUpdatedBy($updatedBy): void
    {
        $this->updatedBy = $updatedBy;
    }
}