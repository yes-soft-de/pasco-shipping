<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\ShipmentLogManager;
use App\Request\ShipmentLogCreateRequest;
use App\Response\ShipmentLogGetResponse;

class ShipmentLogService
{
    private $autoMapping;
    private $shipmentLogManager;

    public function __construct(AutoMapping $autoMapping, ShipmentLogManager $shipmentLogManager)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentLogManager = $shipmentLogManager;
    }

    public function create(ShipmentLogCreateRequest $request)
    {
        return $this->shipmentLogManager->create($request);
    }

    public function getAllShipmentsLogs()
    {
        $shipmentsLogsResponse = [];

        $shipmentsLogs = $this->shipmentLogManager->getAllShipmentsLogs();

        foreach ($shipmentsLogs as $shipmentLog)
        {
            $shipmentsLogsResponse[] = $this->autoMapping->map('array', ShipmentLogGetResponse::class, $shipmentLog);
        }

        return $shipmentsLogsResponse;
    }

    public function getShipmentLogsByShipmentID($shipmentID)
    {
        $shipmentsLogsResponse = [];

        $shipmentsLogs = $this->shipmentLogManager->getShipmentLogsByShipmentID($shipmentID);

        foreach ($shipmentsLogs as $shipmentLog)
        {
            $shipmentsLogsResponse[] = $this->autoMapping->map('array', ShipmentLogGetResponse::class, $shipmentLog);
        }

        return $shipmentsLogsResponse;
    }

}