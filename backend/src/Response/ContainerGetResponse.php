<?php

namespace App\Response;

class ContainerGetResponse
{
    public $id;

    public $containerNumber;

    public $createdAt;

    public $updatedAt;

    public $status;

    public $createdByUser;

    public $createdByUserImage;

    public $updatedByUser;

    public $updatedByUserImage;

    public $type;

    public $subcontractName;

    public $consigneeName;

    public $shipperName;

    public $capacityCPM;

    public $widthInMeter;

    public $hightInMeter;

    public $lengthInMeter;

    public $shipments = [];

}