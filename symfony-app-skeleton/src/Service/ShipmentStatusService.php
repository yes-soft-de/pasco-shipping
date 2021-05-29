<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\ShipmentStatusManager;
use App\Response\ShipmentStatusGetResponse;

class ShipmentStatusService
{
    private $autoMapping;
    private $shipmentStatusManager;

    public function __construct(AutoMapping $autoMapping, ShipmentStatusManager $shipmentStatusManager)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentStatusManager = $shipmentStatusManager;
    }

    public function getUnPackedShipments()
    {
        $shipmentsResponse = [];

        $shipmentResults = $this->shipmentStatusManager->getUnPackedShipments();

        foreach($shipmentResults as $shipmentResult)
        {
            $shipmentsResponse[] = $this->autoMapping->map('array', ShipmentStatusGetResponse::class, $shipmentResult);
        }

        return $shipmentsResponse;
    }

}