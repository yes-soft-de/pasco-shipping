<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Manager\MainManager;
use App\Request\UserUpdateRequest;
use App\Response\StatisticsGetResponse;
use App\Response\UserRegisterResponse;

class MainService
{
    private $autoMapping;
    private $mainManager;
    private $shipmentOrderService;

    public function __construct(AutoMapping $autoMapping, MainManager $mainManager, ShipmentOrderService $shipmentOrderService)
    {
        $this->autoMapping = $autoMapping;
        $this->mainManager = $mainManager;
        $this->shipmentOrderService = $shipmentOrderService;
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

    public function filterShipments($request)
    {
        return $this->shipmentOrderService->filterShipments($request);
    }

}