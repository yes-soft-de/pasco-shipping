<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\WarehouseEntity;
use App\Manager\WarehouseManager;
use App\Request\WarehouseCreateRequest;
use App\Request\WarehouseUpdateRequest;
use App\Response\WarehouseCreateResponse;
use App\Response\WarehouseGetResponse;

class WarehouseService
{
    private $autoMapping;
    private $warehouseManager;

    public function __construct(AutoMapping $autoMapping, WarehouseManager $warehouseManager)
    {
        $this->autoMapping = $autoMapping;
        $this->warehouseManager = $warehouseManager;
    }

    public function create(WarehouseCreateRequest $request)
    {
        $warehouseResult = $this->warehouseManager->create($request);

        return $this->autoMapping->map(WarehouseEntity::class, WarehouseCreateResponse::class, $warehouseResult);
    }

    public function update(WarehouseUpdateRequest $request)
    {
        $warehouseEntity = $this->warehouseManager->update($request);

        return $this->autoMapping->map(WarehouseEntity::class, WarehouseGetResponse::class, $warehouseEntity);
    }

}