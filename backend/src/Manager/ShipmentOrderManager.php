<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentOrderStatusConstant;
use App\Constant\ShipmentStatusConstant;
use App\Constant\ShippingTypeConstant;
use App\Constant\ShippingWayConstant;
use App\Entity\OrderShipmentEntity;
use App\Repository\OrderShipmentEntityRepository;
use App\Request\AirwaybillCreateRequest;
use App\Request\ContainerCreateRequest;
use App\Request\DeleteRequest;
use App\Request\ImageCreateRequest;
use App\Request\OrderShipmentByDashboardCreateRequest;
use App\Request\OrderShipmentByDashboardUpdateRequest;
use App\Request\OrderShipmentCreateRequest;
use App\Request\OrderShipmentUpdateByClientRequest;
use App\Request\OrderShipmentUpdateRequest;
use App\Request\PendingHolderCreateRequest;
use App\Request\ShipmentFilterRequest;
use App\Request\ShipmentOrderStatusUpdateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest;
use App\Request\ShipmentWaitingFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentOrderManager
{
    private $autoMapping;
    private $entityManager;
    private $orderShipmentEntityRepository;
    private $shipmentStatusManager;
    private $containerManager;
    private $airWaybillManager;
    private $containerSpecificationManager;
    private $airWaybillSpecificationManager;
    private $pendingHolderManager;
    private $imageManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderShipmentEntityRepository $orderShipmentEntityRepository,
                                ShipmentStatusManager $shipmentStatusManager, ContainerManager $containerManager, ImageManager $imageManager, AirwaybillManager $airWaybillManager,
    PendingHolderManager $pendingHolderManager, AirwaybillSpecificationManager $airWaybillSpecificationManager, ContainerSpecificationManager $containerSpecificationManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderShipmentEntityRepository = $orderShipmentEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->containerManager = $containerManager;
        $this->airWaybillManager = $airWaybillManager;
        $this->containerSpecificationManager = $containerSpecificationManager;
        $this->airWaybillSpecificationManager = $airWaybillSpecificationManager;
        $this->imageManager = $imageManager;
        $this->pendingHolderManager = $pendingHolderManager;
    }

    public function createShipmentOrder(OrderShipmentCreateRequest $request)
    {
        $orderShipmentEntity = $this->autoMapping->map(OrderShipmentCreateRequest::class, OrderShipmentEntity::class, $request);

        $orderShipmentEntity->setStatus(ShipmentOrderStatusConstant::$WAITING_SHIPMENT_STATUS);

        if(count($request->getRequestedHolders()) > 0)
        {
            $orderShipmentEntity->setHolderCount(count($request->getRequestedHolders()));
        }
        elseif(count($request->getRequestedHolders() == 0))
        {
            $orderShipmentEntity->setHolderCount(1);
        }

        $this->entityManager->persist($orderShipmentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Insert the images of the shipment
        $this->insertImagesOfShipment($request->getImages(), $orderShipmentEntity->getId());

        // Insert the requested holders of the shipment
        if(count($request->getRequestedHolders()) > 0)
        {
            $this->createPendingHolders($request->getRequestedHolders(), $orderShipmentEntity->getId());
        }

        return $orderShipmentEntity;
    }

    public function createShipmentOrderByDashboard(OrderShipmentByDashboardCreateRequest $request)
    {
        $orderShipmentEntity = $this->autoMapping->map(OrderShipmentByDashboardCreateRequest::class, OrderShipmentEntity::class, $request);

        if(count($request->getRequestedHolders()) > 0)
        {
            $orderShipmentEntity->setHolderCount(count($request->getRequestedHolders()));
        }
        elseif(count($request->getRequestedHolders() == 0))
        {
            $orderShipmentEntity->setHolderCount(1);
        }

        $orderShipmentEntity->setStatus(ShipmentOrderStatusConstant::$WAITING_SHIPMENT_STATUS);

        $this->entityManager->persist($orderShipmentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Insert the images of the shipment
        $this->insertImagesOfShipment($request->getImages(), $orderShipmentEntity->getId());

        // Insert the requested holders of the shipment
        if(count($request->getRequestedHolders()) > 0)
        {
            $this->createPendingHolders($request->getRequestedHolders(), $orderShipmentEntity->getId());
        }

        return $orderShipmentEntity;
    }

    public function getWaitingShipmentsOrders()
    {
        return $this->orderShipmentEntityRepository->getShipmentsOrdersByStatus(ShipmentOrderStatusConstant::$WAITING_SHIPMENT_STATUS);
    }

    public function getAcceptedShipmentsOrders()
    {
        return $this->orderShipmentEntityRepository->getShipmentsOrdersByStatus(ShipmentOrderStatusConstant::$ACCEPTED_SHIPMENT_STATUS);
    }

    public function updateShipmentOrderStatus(ShipmentOrderStatusUpdateRequest $request)
    {
        // First, we update the status of the order
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());
        
        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(ShipmentOrderStatusUpdateRequest::class, OrderShipmentEntity::class, 
            $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            /**
             * Second, we check the new status
             * if it is 'accepted' then we have to insert a new row with the shipmentID in the ShipmentStatusEntity
             * otherwise, we just continue without inserting a new row in the ShipmentStatusEntity
             */
            if($request->getStatus() == ShipmentOrderStatusConstant::$ACCEPTED_SHIPMENT_STATUS)
            {
                $shipmentStatusRequest = new ShipmentStatusCreateRequest();

                $shipmentStatusRequest->setShipmentID($request->getId());
                $shipmentStatusRequest->setCreatedBy($request->getUpdatedBy());

                $this->shipmentStatusManager->create($shipmentStatusRequest);
            }

            /**
             * Thirdly, create new holder if its type is FCL and the export warehouse is External
             */
            $this->checkRequestedHolderTypeAndWarehouseType($shipmentOrderEntity);

            return $shipmentOrderEntity;
        }
    }

    // Used when shipment is measured
    public function updateShipmentOrder(OrderShipmentUpdateRequest $request)
    {
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(OrderShipmentUpdateRequest::class, OrderShipmentEntity::class,
                $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            /**
             * Shipment order update occurs when shipment is measured and pocketed,
             * as a result, we have to update the shipmentStatus in Shipment Status Entity
             */
            if($request->getShipmentStatus() == ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS)
            {
                $shipmentStatusRequest = $this->autoMapping->map(OrderShipmentUpdateRequest::class, ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, $request);
                
                $shipmentStatusRequest->setShipmentID($request->getId());
                
                $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);
            }

            return $shipmentOrderEntity;
        }
    }

    public function updateShipmentOrderByClient(OrderShipmentUpdateByClientRequest $request)
    {
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(OrderShipmentUpdateByClientRequest::class, OrderShipmentEntity::class,
                $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentOrderEntity;
        }
    }

    public function updateShipmentOrderByDashboard(OrderShipmentByDashboardUpdateRequest $request)
    {
        $shipmentOrderEntity = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$shipmentOrderEntity)
        {
            return  $shipmentOrderEntity;
        }
        else
        {
            $shipmentOrderEntity = $this->autoMapping->mapToObject(OrderShipmentByDashboardUpdateRequest::class, OrderShipmentEntity::class,
                $request, $shipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentOrderEntity;
        }
    }

    public function getWaitingShipmentsOrdersByTransportationType($transportationType)
    {
          return $this->orderShipmentEntityRepository->getShipmentsOrdersByTransportationTypeAndStatus($transportationType, ShipmentOrderStatusConstant::$WAITING_SHIPMENT_STATUS);
    }

    public function getWaitingShipmentsOrderByUserID($userID)
    {
        return $this->orderShipmentEntityRepository->getWaitingShipmentsOrderByUserID($userID);
    }

    public function getShipmentOrderById($id)
    {
        $order = $this->orderShipmentEntityRepository->getShipmentOrderById($id);

        if ($order)
        {
            $order['images'] = $this->imageManager->getImagesByShipmentID($id);
        }

        return $order;
    }

    public function getImagesByShipmentID($shipmentID)
    {
        return $this->imageManager->getImagesByShipmentID($shipmentID);
    }

    public function getCountOfShipmentsOrdersByStatus($status)
    {
        return count($this->orderShipmentEntityRepository->findBy(["status"=>$status]));
    }

    public function getCountOfAllShipmentsOrders()
    {
        return count($this->orderShipmentEntityRepository->findAll());
    }

    public function filterWaitingShipmentsOrders(ShipmentWaitingFilterRequest $request)
    {
        $shipments = $this->orderShipmentEntityRepository->filterWaitingShipmentsOrders($request->getTransportationType(), $request->getIsExternalWarehouse(), $request->getExportWarehouseID(),
        $request->getPaymentTime());

        if($shipments)
        {
            foreach ($shipments as $key=>$val)
            {
                $shipments[$key]['images'] = $this->imageManager->getImagesByShipmentID($val['id']);
            }
        }

        return $shipments;
    }

    public function filterAcceptedShipments(ShipmentFilterRequest $request)
    {
        $response = [];

        $containerID = $this->containerManager->getContainerByNumber($request->getContainerNumber());

        $airWaybillID = $this->airWaybillManager->getAirWaybillByNumber($request->getAirWaybillNumber());

        $shipments = $this->orderShipmentEntityRepository->filterAcceptedShipments($request->getTransportationType(), $request->getIsExternalWarehouse(), $request->getTrackNumber(), 
        $request->getStatus(), $request->getExportWarehouseID(), $request->getImportWarehouseID(), $request->getPaymentTime(), $request->getLaunchCountry(), $request->getTargetCountry(), 
        $request->getDateOne(), $request->getDateTwo(), $containerID, $airWaybillID, $request->getClientUserID());

        if($shipments)
        {
            $response['totalCount'] = count($shipments);

            if($request->getTrackNumber())
            {
                foreach($shipments as $key=>$val)
                {
                    $shipments[$key]['shipmentStatusInfo'] = $this->getShipmentStatusAndTracksByShipmentIdAndTrackNumber($val['id'], $request->getTrackNumber());
                }
            }
            else
            {
                foreach($shipments as $key=>$val)
                {
                    $shipments[$key]['shipmentStatusInfo'] = $this->getShipmentStatusAndTracksByShipmentID($val['id']);
                }
            }

            $response['shipments'] = $shipments;
        }
        else
        {
            $response['shipments'] = [];
            $response['totalCount'] = 0;
        }

        $response['statistics']['received'] = $this->getShipmentsCountByTransportationTypeAndShipmentStatusAndWarehouseTypeAndWarehousesIDs($request->getTransportationType(), ShipmentStatusConstant::$RECEIVED_SHIPMENT_STATUS,
            $request->getIsExternalWarehouse(), $request->getExportWarehouseID(), $request->getImportWarehouseID());

        $response['statistics']['notDelivered'] = $this->getShipmentsCountByTransportationTypeAndWarehouseTypeAndWarehousesIDsAndNotDelivered($request->getTransportationType(), $request->getIsExternalWarehouse(), $request->getExportWarehouseID(),
            $request->getImportWarehouseID());

        $response['statistics']['delivered'] = $this->getShipmentsCountByTransportationTypeAndShipmentStatusAndWarehouseTypeAndWarehousesIDs($request->getTransportationType(), ShipmentStatusConstant::$DELIVERED_SHIPMENT_STATUS,
            $request->getIsExternalWarehouse(), $request->getExportWarehouseID(), $request->getImportWarehouseID());
        
        return $response;
    }

    public function getShipmentsCountByTransportationTypeAndShipmentStatusAndWarehouseTypeAndWarehousesIDs($transportationType, $shipmentStatus, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID)
    {
        return count($this->orderShipmentEntityRepository->getShipmentsByTransportationTypeAndShipmentStatusAndWarehouseTypeAndWarehousesIDs($transportationType, $shipmentStatus, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID));
    }

    public function getShipmentsCountByTransportationTypeAndWarehouseTypeAndWarehousesIDsAndNotDelivered($transportationType, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID)
    {
        return count($this->orderShipmentEntityRepository->getShipmentsByTransportationTypeAndWarehouseTypeAndWarehousesIDsAndNotDelivered($transportationType, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID));
    }

    public function getShipmentOrderByMarkID($markID)
    {
        return $this->orderShipmentEntityRepository->getShipmentOrderByMarkID($markID);
    }

    public function getShipmentOrderByReceiver($receiverID)
    {
        return $this->orderShipmentEntityRepository->getShipmentOrderByReceiver($receiverID);
    }

    public function getShipmentOrderByDistributor($distributorID)
    {
        return $this->orderShipmentEntityRepository->getShipmentOrderByDistributor($distributorID);
    }

    public function getShipmentOrderByUnitName($unitName)
    {
        return $this->orderShipmentEntityRepository->findBy(["unit"=>$unitName]);
    }

    public function getShipmentStatusAndTracksByShipmentID($shipmentID)
    {
        return $this->shipmentStatusManager->getShipmentStatusAndTracksByShipmentID($shipmentID);
    }

    public function getShipmentStatusByShipmentID($shipmentID)
    {
        return $this->shipmentStatusManager->getByShipmentID($shipmentID);
    }

    public function getPendingHoldersByShipmentIdAndShippingType($shipmentID, $shippingWay)
    {
        $pendingHolders = $this->pendingHolderManager->getPendingHoldersByShipmentID($shipmentID);

        if($pendingHolders)
        {
            if($shippingWay == ShippingWayConstant::$SEA_SHIPPING_WAY)
            {
                foreach ($pendingHolders as $key => $val)
                {
                    $specification = $this->containerSpecificationManager->getContainerSpecificationById($val['specificationID']);

                    if($specification)
                    {
                        $pendingHolders[$key]['specificationName'] = $specification['name'];
                    }
                    else
                    {
                        $pendingHolders[$key]['specificationName'] = "";
                    }
                }
            }
            if($shippingWay == ShippingWayConstant::$AIR_SHIPPING_WAY)
            {
                foreach ($pendingHolders as $key => $val)
                {
                    $specification = $this->airWaybillSpecificationManager->getAirwaybillSpecificationByID($val['specificationID']);

                    if($specification)
                    {
                        $pendingHolders[$key]['specificationName'] = $specification['name'];
                    }
                    else
                    {
                        $pendingHolders[$key]['specificationName'] = "";
                    }
                }
            }
        }

        return $pendingHolders;
    }

    public function getShipmentStatusAndTracksByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentStatusManager->getShipmentStatusAndTracksByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function checkRequestedHolderTypeAndWarehouseType(OrderShipmentEntity $orderShipmentEntity)
    {
        // This function creates holder depending on the type of the warehouse and the requested holder
        if($orderShipmentEntity->getHolderType() == ShippingTypeConstant::$FCL_SHIPPING_TYPE && $orderShipmentEntity->getIsExternalWarehouse() == true)
        {
            if($orderShipmentEntity->getTransportationType() == ShippingWayConstant::$AIR_SHIPPING_WAY)
            {
                // Create new air waybills as client requested
                $pendingHolders = $this->pendingHolderManager->getPendingHoldersByShipmentID($orderShipmentEntity->getId());

                if($pendingHolders)
                {
                    foreach($pendingHolders as $pendingHolder)
                    {
                        $this->createFCLAirWaybill($orderShipmentEntity->getId(), $pendingHolder['specificationID']);
                    }
                }
            }
            elseif($orderShipmentEntity->getTransportationType() == ShippingWayConstant::$SEA_SHIPPING_WAY)
            {
                // Create new containers as client requested
                $pendingHolders = $this->pendingHolderManager->getPendingHoldersByShipmentID($orderShipmentEntity->getId());

                if($pendingHolders)
                {
                    foreach($pendingHolders as $pendingHolder)
                    {
                        $this->createFCLContainer($orderShipmentEntity->getId(), $pendingHolder['specificationID']);
                    }
                }
            }
        }
    }

    public function createFCLContainer($shipmentID, $specificationID)
    {
        $containerCreateRequest = new ContainerCreateRequest();

        $containerCreateRequest->setShipmentID($shipmentID);
        $containerCreateRequest->setSpecificationID($specificationID);

        $this->containerManager->createFCLContainer($containerCreateRequest);
    }

    public function createFCLAirWaybill($shipmentID, $specificationID)
    {
        $airWaybillCreateRequest = new AirwaybillCreateRequest();

        $airWaybillCreateRequest->setShipmentID($shipmentID);
        $airWaybillCreateRequest->setSpecificationID($specificationID);

        $this->airWaybillManager->createFCLAirWaybill($airWaybillCreateRequest);
    }

    public function insertImagesOfShipment($imagesArray, $shipmentID)
    {
        if(is_array($imagesArray) && count($imagesArray) > 0)
        {
            $imageRequest = new ImageCreateRequest();

            foreach ($imagesArray as $image)
            {
                $imageRequest->setImage($image);
                $imageRequest->setShipmentID($shipmentID);

                $this->imageManager->create($imageRequest);
            }
        }
    }

    public function createPendingHolders($requestedHoldersArray, $shipmentID)
    {
        $holderCreateRequest = new PendingHolderCreateRequest();

        foreach ($requestedHoldersArray as $holder)
        {
            $holderCreateRequest->setShipmentID($shipmentID);
            $holderCreateRequest->setSpecificationID($holder['specificationID']);
            $holderCreateRequest->setNotes($holder['notes']);

            $this->pendingHolderManager->create($holderCreateRequest);
        }
    }

    public function deleteShipmentOrder(DeleteRequest $request)
    {
        $item = $this->orderShipmentEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            // First, check if it is still waiting and does not have other records in other tables
            $result = $this->shipmentStatusManager->getByShipmentID($item->getId());

            if(!$result)
            {
                $this->entityManager->remove($item);
                $this->entityManager->flush();

                return $item;
            }
            else
            {
                return "The order is being entered the shipping procedure";
            }
        }
    }
    
    public function deleteAllOrders()
    {
        return $this->orderShipmentEntityRepository->deleteAllOrders();
    }

}