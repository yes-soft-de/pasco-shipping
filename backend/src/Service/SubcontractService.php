<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SubcontractEntity;
use App\Manager\SubcontractManager;
use App\Request\SubcontractCreateRequest;
use App\Request\SubcontractUpdateRequest;
use App\Response\SubcontractCreateResponse;
use App\Response\SubcontractGetResponse;

class SubcontractService
{
    private $autoMapping;
    private $subcontractManager;

    public function __construct(AutoMapping $autoMapping, SubcontractManager $subcontractManager)
    {
        $this->autoMapping = $autoMapping;
        $this->subcontractManager = $subcontractManager;
    }

    public function create(SubcontractCreateRequest $request)
    {
        $subcontractResult = $this->subcontractManager->create($request);

        return $this->autoMapping->map(SubcontractEntity::class, SubcontractCreateResponse::class, $subcontractResult);
    }

    public function update(SubcontractUpdateRequest $request)
    {
        $subcontractResult = $this->subcontractManager->update($request);

        return $this->autoMapping->map(SubcontractEntity::class, SubcontractGetResponse::class, $subcontractResult);
    }

    // public function getShipmentByTrackNumber($trackNumber)
    // {
    //     $shipmentResponse = [];

    //     $shipment = $this->subcontractManager->getShipmentByTrackNumber($trackNumber);
        
    //     foreach($shipment as $row)
    //     {
    //         $shipmentResponse = $this->autoMapping->map('array', ShipmentByTrackNumberGetResponse::class, $row);
    //     }

    //     return $shipmentResponse;
    // }

}