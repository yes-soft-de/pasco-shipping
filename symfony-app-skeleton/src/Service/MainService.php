<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Manager\MainManager;
use App\Request\ShipmentFilterRequest;
use App\Request\UserUpdateRequest;
use App\Response\StatisticsGetResponse;
use App\Response\UserRegisterResponse;

class MainService
{
    const WAITING_SHIPMENT_STATUS = "waiting";
    const ACCEPTED_SHIPMENT_STATUS = "accepted";

    private $autoMapping;
    private $mainManager;
    private $shipmentOrderService;
    private $shipmentStatusService;

    public function __construct(AutoMapping $autoMapping, MainManager $mainManager, ShipmentOrderService $shipmentOrderService, ShipmentStatusService $shipmentStatusService)
    {
        $this->autoMapping = $autoMapping;
        $this->mainManager = $mainManager;
        $this->shipmentOrderService = $shipmentOrderService;
        $this->shipmentStatusService = $shipmentStatusService;
    }

    public function update(UserUpdateRequest $request)
    {
        $user = $this->mainManager->update($request);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $user);
    }

    public function findAll()
    {
        return $this->mainManager->findAll();
    }

    public function getStatistics()
    {
        $statistics = $this->mainManager->getStatistics();

        return $this->autoMapping->map('array', StatisticsGetResponse::class, $statistics);
    }

    public function filterShipments(ShipmentFilterRequest $request)
    {
        // if the status of the shipments is waiting, then look up in the Order Shipment table
        if($request->getStatus() != null && $request->getStatus() == $this::WAITING_SHIPMENT_STATUS)
        {
            return $this->shipmentOrderService->filterShipments($request);
        }
        // else if the status of the shipments is accepted, then look up in the Shipment Status table
        elseif($request->getStatus() != null && $request->getStatus() == $this::ACCEPTED_SHIPMENT_STATUS)
        {
            return $this->shipmentStatusService->filterShipments($request);
        }
    }

}