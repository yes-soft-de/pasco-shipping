<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShiftingShipmentOrderEntity;
use App\Manager\ShiftingShipmentOrderManager;
use App\Request\ShiftingShipmentOrderCreateRequest;
use App\Request\ShiftingShipmentOrderStatusUpdateRequest;
use App\Response\ShiftingShipmentOrderCreateResponse;
use App\Response\ShiftingShipmentOrderFilterResponse;
use App\Response\ShiftingShipmentOrderUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShiftingShipmentOrderService
{
    private $autoMapping;
    private $shiftingShipmentOrderManager;
    private $shipmentOrderService;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShiftingShipmentOrderManager $shiftingShipmentOrderManager, ParameterBagInterface $params,
     ShipmentOrderService $shipmentOrderService)
    {
        $this->autoMapping = $autoMapping;
        $this->shiftingShipmentOrderManager = $shiftingShipmentOrderManager;
        $this->shipmentOrderService = $shipmentOrderService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShiftingShipmentOrderCreateRequest $request)
    {
        $request->setFromImportWarehouseID($this->shipmentOrderService->getImportWarehouseIdByShipmentOrderID($request->getShipmentID()));

        $shiftingShipmentResult = $this->shiftingShipmentOrderManager->create($request);

        if($shiftingShipmentResult instanceof ShiftingShipmentOrderEntity)
        {
            return $this->autoMapping->map(ShiftingShipmentOrderEntity::class, ShiftingShipmentOrderCreateResponse::class, $shiftingShipmentResult);
        }

        return $shiftingShipmentResult;
    }

    public function updateStatus(ShiftingShipmentOrderStatusUpdateRequest $request)
    {
        $shiftingShipmentOrderEntity = $this->shiftingShipmentOrderManager->updateStatus($request);

        return $this->autoMapping->map(ShiftingShipmentOrderEntity::class, ShiftingShipmentOrderUpdateResponse::class, $shiftingShipmentOrderEntity);
    }

    public function filterShiftingShipmentOrders($request)
    {
        $shiftingShipmentOrdersResponse = [];

        $shiftingShipmentOrders = $this->shiftingShipmentOrderManager->filterShiftingShipmentOrders($request);

        foreach($shiftingShipmentOrders as $shiftingShipmentOrder)
        {
            $shiftingShipmentOrdersResponse[] = $this->autoMapping->map('array', ShiftingShipmentOrderFilterResponse::class, $shiftingShipmentOrder);
        }

        return $shiftingShipmentOrdersResponse;
    }

    public function delete($request)
    {
        $result = $this->shiftingShipmentOrderManager->delete($request);

        if($result instanceof ShiftingShipmentOrderEntity)
        {
            return $this->autoMapping->map(ShiftingShipmentOrderEntity::class, ShiftingShipmentOrderCreateResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

    public function forceDelete($request)
    {
        $result = $this->shiftingShipmentOrderManager->forceDelete($request);

        if($result instanceof ShiftingShipmentOrderEntity)
        {
            return $this->autoMapping->map(ShiftingShipmentOrderEntity::class, ShiftingShipmentOrderCreateResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

}