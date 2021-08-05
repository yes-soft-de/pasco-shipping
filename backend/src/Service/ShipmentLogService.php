<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\ShipmentStatusConstant;
use App\Manager\ShipmentLogManager;
use App\Request\ShipmentLogCreateRequest;
use App\Response\ShipmentLogForDashboardGetResponse;
use App\Response\ShipmentLogGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentLogService
{
    private $autoMapping;
    private $shipmentLogManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentLogManager $shipmentLogManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentLogManager = $shipmentLogManager;
        $this->params = $params->get('upload_base_url') . '/';
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

    public function getAllShipmentLogsByShipmentID($shipmentID)
    {
        $shipmentsLogsResponse = [];

        $shipmentsLogs = $this->shipmentLogManager->getAllShipmentLogsByShipmentID($shipmentID);

        $shipmentsLogsResult = $this->checkWhatStatusIsPassed($shipmentsLogs, ShipmentStatusConstant::$SHIPMENT_STATUS_ARRAY);
        
        foreach ($shipmentsLogsResult as $shipmentLog)
        {
            if($shipmentLog['createdByUserImage'])
            {
                $shipmentLog['createdByUserImage'] = $this->params . $shipmentLog['createdByUserImage'];
            }

            $shipmentsLogsResponse[] = $this->autoMapping->map('array', ShipmentLogForDashboardGetResponse::class, $shipmentLog);
        }

        return $shipmentsLogsResponse;
    }

    public function checkWhatStatusIsPassed($shipmentsLogs, $fullStates)
    {
        $shipmentsLogsResponse = [];

        $log = [];

        foreach ($shipmentsLogs as $shipmentLog)
        {
            $shipmentLog['isPassed'] = true;

            $shipmentsLogsResponse[] = $shipmentLog;
        }

        // Here we complete the response with the status that the shipment does not passed.
        // Completion started from that last status position that the shipment finished.
        for($index = count($shipmentsLogs); $index < 10; $index++)
        {
            $log['isPassed'] = false;

            $log['shipmentStatus'] = $fullStates[$index];

            $shipmentsLogsResponse[] = $log;
        }

        return $shipmentsLogsResponse;
    }

}