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

    public function getAllShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $shipmentsLogsResponse = [];

        $shipmentsLogs = $this->shipmentLogManager->getAllShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
        // Before auto mapping, we have to check which status is passed and which is not
        $shipmentsLogsResult = $this->checkWhatStatusIsPassed($shipmentsLogs, ShipmentStatusConstant::$SHIPMENT_STATUS_ARRAY);
        
        foreach ($shipmentsLogsResult as $shipmentLog)
        {
            if($this->isKeyInArray($shipmentLog, "createdByUserImage"))
            {
                if($shipmentLog['createdByUserImage'])
                {
                    $shipmentLog['createdByUserImage'] = $this->params . $shipmentLog['createdByUserImage'];
                }
            }

            $shipmentsLogsResponse[] = $this->autoMapping->map('array', ShipmentLogForDashboardGetResponse::class, $shipmentLog);
        }

        return $shipmentsLogsResponse;
    }

    public function checkWhatStatusIsPassed($shipmentsLogs, $fullStates)
    {
        /**
         * This function returns an array of the shipment states, and check each state
         * which is passed and also defines what state doesn't passed yet
         */
        $shipmentsLogsResponse = [];

        $log = [];

        foreach ($fullStates as $state)
        {
            $result = $this->statusIsPassed($shipmentsLogs, $state);

            if($result >= 0)
            {
                $shipmentsLogs[$result]['isPassed'] = true;

                $shipmentsLogsResponse[] = $shipmentsLogs[$result];
            }
            elseif($result == -1)
            {
                $log['isPassed'] = false;

                $log['shipmentStatus'] = $state;

                $shipmentsLogsResponse[] = $log;
            }
        }

        return $shipmentsLogsResponse;
    }

    public function statusIsPassed($shipmentsLogs, $state)
    {
        /**
         * This function search if a shipment status is exist in the shipment logs array
         */
        if($shipmentsLogs)
        {
            foreach ($shipmentsLogs as $key=>$val)
            {
                if($val['shipmentStatus'] == $state)
                {
                    return $key;
                }
            }

            return -1;
        }
    }

    public function isKeyInArray($array, $item)
    {
        if(is_array($array))
        {
            foreach($array as $key=>$val)
            {
                if($key == $item)
                {
                    return true;
                }
            }

            return false;
        }
    }

}