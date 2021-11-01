<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Constant\ShippingTypeConstant;
use App\Entity\ContainerEntity;
use App\Manager\ContainerManager;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerShipmentIdUpdateRequest;
use App\Request\ContainerShippingStatusUpdateRequest;
use App\Request\ContainerStatusUpdateRequest;
use App\Request\ContainerUpdateRequest;
use App\Request\DeleteRequest;
use App\Response\ContainerCreateResponse;
use App\Response\ContainerFilterResponse;
use App\Response\ContainerGetResponse;
use App\Response\DeleteAllGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerService
{
    private $autoMapping;
    private $containerManager;
    private $params;
    private $trackService;

    public function __construct(AutoMapping $autoMapping, ContainerManager $containerManager, ParameterBagInterface $params, TrackService $trackService)
    {
        $this->autoMapping = $autoMapping;
        $this->containerManager = $containerManager;
        $this->trackService = $trackService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerCreateRequest $request)
    {
        $containerResult = $this->containerManager->create($request);

        if($containerResult instanceof ContainerEntity)
        {
            return $this->autoMapping->map(ContainerEntity::class, ContainerCreateResponse::class, $containerResult);
        }

        return $containerResult;
    }

    public function update(ContainerUpdateRequest $request)
    {
        $containerResult = $this->containerManager->update($request);

        if($containerResult instanceof ContainerEntity)
        {
            return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $containerResult);
        }

        return $containerResult;
    }

    public function updateStatus(ContainerStatusUpdateRequest $request)
    {
        $containerResult = $this->containerManager->updateStatus($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $containerResult);
    }

    public function updateShippingStatus(ContainerShippingStatusUpdateRequest $request)
    {
        $containerResult = $this->containerManager->updateShippingStatus($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $containerResult);
    }

    // Just for updating shipmentID of the container, and are not required for the real-time use
    public function updateShipmentID(ContainerShipmentIdUpdateRequest $request)
    {
        $containerResult = $this->containerManager->updateShipmentID($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $containerResult);
    }

    public function getByStatus($status)
    {
        $containersResponse = [];

        $containers = $this->containerManager->getByStatus($status);

        foreach($containers as $container)
        {
            if($container['createdByUserImage'])
            {
                $container['createdByUserImage'] = $this->params . $container['createdByUserImage'];
            }

            if($container['updatedByUserImage'])
            {
                $container['updatedByUserImage'] = $this->params . $container['updatedByUserImage'];
            }

            $containersResponse[] = $this->autoMapping->map('array', ContainerGetResponse::class, $container);
        }

        return $containersResponse;
    }

    public function getContainerById($id)
    {
        $container = $this->containerManager->getContainerById($id);

        if($container)
        {
            if($container['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
            {
                if($container['consigneeID'] == null)
                {
                    $container['consigneeName'] = $container['consignee'];
                }
            }

            if($container['createdByUser'] == null)
            {
                $container['createdByUser'] = $container['clientUserName'];

                if($container['clientUserImage'])
                {
                    $container['createdByUserImage'] = $container['clientUserImage'];
                }
            }

            $container['shipments'] = $this->trackService->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $id);

            // get the sum of total gunny and the sum of total received shipments' quantity
            $container['totalGunnyQuantity'] = $this->getTotalGunnyByContainerID($id);
            $container['totalReceivedShipmentsQuantity'] = $this->getTotalReceivedShipmentsQuantityByContainerID($id);

            $container['freeCapacity'] = $this->trackService->getCurrentCapacityOfContainer($container);

            if ($container['createdByUserImage']) {
                $container['createdByUserImage'] = $this->params . $container['createdByUserImage'];
            }

            if ($container['updatedByUserImage']) {
                $container['updatedByUserImage'] = $this->params . $container['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', ContainerGetResponse::class, $container);
    }

    public function filterContainers($request)
    {
        $containersResponse = [];

        $containers = $this->containerManager->filterContainers($request);

        foreach($containers as $container)
        {
            // get the sum of total gunny and the sum of total received shipments' quantity
            $container['totalGunnyQuantity'] = $this->getTotalGunnyByContainerID($container['id']);
            $container['totalReceivedShipmentsQuantity'] = $this->getTotalReceivedShipmentsQuantityByContainerID($container['id']);

            if($container['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
            {
                if($container['consigneeID'] == null)
                {
                    $container['consigneeName'] = $container['consignee'];
                }
            }

            if($this->trackService->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $container['id']))
            {
                $container['used'] = true;
            }
            else
            {
                $container['used'] = false;
            }

            if($container['createdByUser'] == null)
            {
                $container['createdByUser'] = $container['clientUserName'];

                if($container['clientUserImage'])
                {
                    $container['createdByUserImage'] = $container['clientUserImage'];
                }
            }

            if($container['createdByUserImage'])
            {
                $container['createdByUserImage'] = $this->params . $container['createdByUserImage'];
            }

            if($container['updatedByUserImage'])
            {
                $container['updatedByUserImage'] = $this->params . $container['updatedByUserImage'];
            }

            $containersResponse[] = $this->autoMapping->map('array', ContainerFilterResponse::class, $container);
        }

        return $containersResponse;
    }

    public function getTotalGunnyByContainerID($containerID)
    {
        $totalGunny = 0;

        $shipments = $this->trackService->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($shipments)
        {
            foreach($shipments as $shipment)
            {
                $totalGunny += $shipment->guniQuantity;
            }
        }

        return $totalGunny;
    }

    public function getTotalReceivedShipmentsQuantityByContainerID($containerID)
    {
        $totalReceivedShipmentsQuantity = 0;

        $shipments = $this->trackService->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($shipments)
        {
            foreach($shipments as $shipment)
            {
                $totalReceivedShipmentsQuantity += $shipment->receivedShipmentQuantity;
            }
        }

        return $totalReceivedShipmentsQuantity;
    }

    public function deleteContainerById(DeleteRequest $request)
    {
        // First, check if the air waybill is being used (shipments are stored in it)
        $isUsed = $this->trackService->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $request->getId());

        $result = $this->containerManager->deleteContainerById($request, $isUsed);

        if($result instanceof ContainerEntity)
        {
            return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

    public function deleteAllContainers()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->containerManager->deleteAllContainers();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}