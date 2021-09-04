<?php

namespace App\Response;

class AirwaybillGetResponse
{
    public $id;

    public $airwaybillNumber;

    public $createdAt;

    public $updatedAt;

    public $status;

    public $createdByUser;

    public $createdByUserImage;

    public $updatedByUser;

    public $updatedByUserImage;

    public $type;

    public $specificationName;

    public $subcontractName;

    public $consigneeName;

    public $shipperName;

    public $carrierName;

    public $freeWeight;

    public $shipmentID;

    public $shipments = [];

}