<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\WarehouseEntity;
use App\Manager\WarehouseManager;
use App\Request\WarehouseCreateRequest;
use App\Request\WarehouseFilterRequest;
use App\Request\WarehouseUpdateRequest;
use App\Response\WarehouseCreateResponse;
use App\Response\WarehouseGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class WarehouseService
{
    private $autoMapping;
    private $warehouseManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, WarehouseManager $warehouseManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->warehouseManager = $warehouseManager;
        $this->params = $params->get('upload_base_url') . '/';
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

    public function getAllWarehouses()
    {
        $warehousesResponse = [];

        $warehouses = $this->warehouseManager->getAllWarehouses();

        foreach ($warehouses as $warehouse)
        {
            if($warehouse['createdByUserImage'])
            {
                $warehouse['createdByUserImage'] = $this->params . $warehouse['createdByUserImage'];
            }

            if($warehouse['updatedByUserImage'])
            {
                $warehouse['updatedByUserImage'] = $this->params . $warehouse['updatedByUserImage'];
            }

            $warehousesResponse[] = $this->autoMapping->map('array', WarehouseGetResponse::class, $warehouse);
        }

        return $warehousesResponse;
    }

    public function filterWarehouses(WarehouseFilterRequest $request)
    {
        $warehousesResponse = [];

        $warehouses = $this->warehouseManager->filterWarehouses($request);

        foreach ($warehouses as $warehouse)
        {
            if($warehouse['createdByUserImage'])
            {
                $warehouse['createdByUserImage'] = $this->params . $warehouse['createdByUserImage'];
            }

            if($warehouse['updatedByUserImage'])
            {
                $warehouse['updatedByUserImage'] = $this->params . $warehouse['updatedByUserImage'];
            }

            $warehousesResponse[] = $this->autoMapping->map('array', WarehouseGetResponse::class, $warehouse);
        }

        return $warehousesResponse;
    }

    public function deleteWarehouseById($request)
    {
        $result = $this->warehouseManager->deleteWarehouseById($request);

        return $this->autoMapping->map(WarehouseEntity::class, WarehouseGetResponse::class, $result);
    }

}