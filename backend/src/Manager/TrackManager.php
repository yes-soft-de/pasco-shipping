<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\HolderStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\ShipmentStatusConstant;
use App\Constant\ShippingTypeConstant;
use App\Constant\ShippingWayConstant;
use App\Entity\TrackEntity;
use App\Repository\TrackEntityRepository;
use App\Request\AirwaybillShippingStatusUpdateRequest;
use App\Request\CheckHolderRequest;
use App\Request\ContainerShippingStatusUpdateRequest;
use App\Request\ShipmentLogCreateRequest;
use App\Request\ShipmentOrderImportWarehouseUpdateRequest;
use App\Request\ShipmentStatusCreateRequest;
use App\Request\ShipmentStatusOfHolderUpdateRequest;
use App\Request\ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateByHolderTypeAndIdRequest;
use App\Request\TrackUpdateByTravelIdRequest;
use App\Request\TrackUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class TrackManager
{
    private $autoMapping;
    private $entityManager;
    private $trackEntityRepository;
    private $shipmentStatusManager;
    private $containerManager;
    private $containerSpecificationManager;
    private $airwaybillManager;
    private $shipmentOrderManager;
    private $shipmentLogManager;
    private $gunnyShipmentManager;
    private $receivedShipmentManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TrackEntityRepository $trackEntityRepository,
     ShipmentStatusManager $shipmentStatusManager, ContainerManager $containerManager, AirwaybillManager $airwaybillManager, ContainerSpecificationManager $containerSpecificationManager,
     ShipmentOrderManager $shipmentOrderManager, ShipmentLogManager $shipmentLogManager, GunnyShipmentManager $gunnyShipmentManager,
     ReceivedShipmentManager $receivedShipmentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackEntityRepository = $trackEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->containerManager = $containerManager;
        $this->containerSpecificationManager = $containerSpecificationManager;
        $this->airwaybillManager = $airwaybillManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentLogManager = $shipmentLogManager;
        $this->gunnyShipmentManager = $gunnyShipmentManager;
        $this->receivedShipmentManager = $receivedShipmentManager;
    }

    public function create(TrackCreateRequest $request)
    {
        // First of all, we have to update the import warehouse of the shipment order
        $this->updateImportWarehouseOfShipmentOrder($request->getShipmentID(), $request->getImportWarehouseID());

        /**
         * Now, we have to check if the holder is going to uploaded onto different travel or not
         * To do that, we just need to check if there is a previous record with the info: shipmentID + trackNumber
         */
        $differentTravel = $this->checkIfShipmentGoesOnDifferentTravel($request->getShipmentID(), $request->getTrackNumber(), $request->getTravelID());
        
        if($differentTravel)
        {
            /**
             * Before continue, if the export warehouse of the shipment is external, and the holder is of type FCL,
             * then the measure phase will be passed, as a result, we have to insert a log of MEASURED status
             */
            if($this->checkIfExternalWarehouseAndFCLHolder($request->getShipmentID(), $request->getHolderType(), $request->getHolderID()))
            {
                $this->createShipmentLog($request->getShipmentID(), $request->getTrackNumber(), ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS, $request->getCreatedBy());
            }

            // Enter new shipment info with new track number in the ShipmentStatus entity
            $shipmentStatusRequest = $this->autoMapping->map(TrackCreateRequest::class, ShipmentStatusCreateRequest::class, $request);

            $shipmentStatusEntity = $this->shipmentStatusManager->createNewShipmentInfo($shipmentStatusRequest);

            // Enter new shipment info with the new track number in the Track entity
            $request->setTrackNumber($shipmentStatusEntity->getTrackNumber());

            $trackEntity = $this->autoMapping->map(TrackCreateRequest::class, TrackEntity::class, $request);
            
            $this->entityManager->persist($trackEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();
        }
        else
        {
            // We insert new raw in the TrackEntity
            $trackEntity = $this->autoMapping->map(TrackCreateRequest::class, TrackEntity::class, $request);
            
            $this->entityManager->persist($trackEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            /**
             * Then, we update the record related to the shipment in the ShipmentStatusEntity when the following conditions
             * are true; the shipment stored completely in one holder OR shipment stored in more than one holder, and the storing
             * of the final part is finished
             */ 
            if($request->getIsInOneHolder() == true || ($request->getIsInOneHolder() == false && $request->getPacked() == true))
            {
                /**
                 * Before continue, if the export warehouse of the shipment is external, and the holder is of type FCL,
                 * then the measure phase will be passed, as a result, we have to insert a log of MEASURED status
                 */
                if($this->checkIfExternalWarehouseAndFCLHolder($request->getShipmentID(), $request->getHolderType(), $request->getHolderID()))
                {
                    $this->createShipmentLog($request->getShipmentID(), $request->getTrackNumber(), ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS, $request->getCreatedBy());
                }

                // Now we can continue updating the shipmentStatus
                $shipmentStatusRequest = $this->autoMapping->map(TrackCreateRequest::class, ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, $request);
    
                $shipmentStatusRequest->setUpdatedBy($request->getCreatedBy());
    
                $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);
            }
        }

        return $trackEntity;
    }

    public function updateByHolderIdAndTrackNumber(TrackUpdateRequest $request)
    {
        //Firstly, we update the track record
        $trackEntity = $this->trackEntityRepository->getByHolderIdAndTrackNumber($request->getHolderID(), $request->getTrackNumber());

        if(!$trackEntity)
        {
            return $trackEntity;
        }
        else
        {
            $trackEntity = $this->autoMapping->mapToObject(TrackUpdateRequest::class, TrackEntity::class, $request, $trackEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            if($trackEntity)
            {
                // Secondly, update the status in the ShipmentStatusEntity
                $shipmentStatusRequest = $this->autoMapping->map(TrackUpdateRequest::class, ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, $request);

                $shipmentStatusRequest->setShipmentID($trackEntity->getShipmentID());
                $shipmentStatusRequest->setUpdatedBy($request->getUpdatedBy());

                $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);
            }

            return $trackEntity;
        }
    }

    public function updateByHolderTypeAndHolderID(TrackUpdateByHolderTypeAndIdRequest $request)
    {
        /**
         * Call this function when we want to update multiple shipments status related to specific holder
         * after UPLOADING the holder, or after CUSTOM CLEARING the holder, or after TRANSFERRING the holder to
         * the proxy warehouse in the target city.
         */
        $tracks = $this->trackEntityRepository->getByHolderTypeAndHolderID($request->getHolderType(), $request->getHolderID());

        if(!$tracks)
        {
            return $tracks;
        }
        else
        {
            // First, update the shippingStatus of the holder
            $this->updateShippingStatusOfSpecificHolder($request->getHolderType(), $request->getHolderID(), $request->getShipmentStatus(), $request->getUpdatedBy());

            // Secondly, update the status in the ShipmentStatusEntity for all shipments
            foreach($tracks as $track)
            {
                if($track)
                {
                    $shipmentStatusRequest = $this->autoMapping->map(TrackUpdateByHolderTypeAndIdRequest::class, ShipmentStatusOfHolderUpdateRequest::class, $request);

                    $shipmentStatusRequest->setShipmentID($track->getShipmentID());
                    $shipmentStatusRequest->setTrackNumber($track->getTrackNumber());
                    $shipmentStatusRequest->setUpdatedBy($request->getUpdatedBy());

                    /**
                     * Before continue, if the holder is of type FCL, and the status that we want to update the holder to is Arrived,
                     * then we have to update the shipment status to reach the Delivered state
                     */
                    if($request->getShipmentStatus() == ShipmentStatusConstant::$ARRIVED_SHIPMENT_STATUS AND ($this->checkIfHolderIsFCLByHolderTypeAndHolderID($request->getHolderType(), $request->getHolderID())))
                    {
                        // set the final status that the shipment will take in ShipmentStatusEntity to DELIVERED
                        $shipmentStatusRequest->setShipmentStatus(ShipmentStatusConstant::$DELIVERED_SHIPMENT_STATUS);

                        // Insert log for the shipment starting from RELEASED status till ARRIVED status
                        $this->shipmentLogManager->createShipmentLogsForSpecificGroupOfStatus($track->getShipmentID(), $track->getTrackNumber(), ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS,
                            ShipmentStatusConstant::$ARRIVED_SHIPMENT_STATUS, $request->getUpdatedBy());
                    }

                    $this->shipmentStatusManager->updateShipmentStatusOfSpecificHolder($shipmentStatusRequest);
                }
            }
     
            return $tracks;
        }
    }

    public function updateShippingStatusOfSpecificHolder($holderType, $holderID, $shippingStatus, $updatedBy)
    {
        if($holderType == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
        {
            $airWaybillShippingStatusUpdateRequest = new AirwaybillShippingStatusUpdateRequest();

            $airWaybillShippingStatusUpdateRequest->setId($holderID);
            $airWaybillShippingStatusUpdateRequest->setShippingStatus($shippingStatus);
            $airWaybillShippingStatusUpdateRequest->setUpdatedBy($updatedBy);

            $this->airwaybillManager->updateShippingStatus($airWaybillShippingStatusUpdateRequest);
        }
        elseif($holderType == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
        {
            $containerShippingStatusUpdateRequest = new ContainerShippingStatusUpdateRequest();

            $containerShippingStatusUpdateRequest->setId($holderID);
            $containerShippingStatusUpdateRequest->setShippingStatus($shippingStatus);
            $containerShippingStatusUpdateRequest->setUpdatedBy($updatedBy);

            $this->containerManager->updateShippingStatus($containerShippingStatusUpdateRequest);
        }
    }

    public function updateShippingStatusOfHolderOfSpecificTracks($tracks, $shippingStatus, $updatedBy)
    {
        foreach($tracks as $track)
        {
            $this->updateShippingStatusOfSpecificHolder($track->getHolderType(), $track->getHolderID(), $shippingStatus, $updatedBy);
        }
    }

    public function updateByTravelID(TrackUpdateByTravelIdRequest $request)
    {
        // First, check the status, if the travel started or arrived (released) then continue updating the shipments status
        if($request->getShipmentStatus() == ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS || $request->getShipmentStatus() == ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS)
        {
            //Secondly, get shipmentID and trackNumber for each shipment in the travel
            $tracks = $this->trackEntityRepository->getByTravelID($request->getTravelID());

            if(!$tracks)
            {
                return $tracks;
            }
            else
            {
                // Thirdly, update the shippingStatus of all holders in the travel
                $this->updateShippingStatusOfHolderOfSpecificTracks($tracks, $request->getShipmentStatus(), $request->getUpdatedBy());

                // Fourthly, update the status in the ShipmentStatusEntity for all shipments
                foreach($tracks as $track)
                {
                    if($track)
                    {
                        $shipmentStatusRequest = $this->autoMapping->map(TrackUpdateByTravelIdRequest::class, ShipmentStatusOfHolderUpdateRequest::class, $request);

                        $shipmentStatusRequest->setShipmentID($track->getShipmentID());
                        $shipmentStatusRequest->setTrackNumber($track->getTrackNumber());

                        $this->shipmentStatusManager->updateShipmentStatusOfSpecificHolder($shipmentStatusRequest);
                    }
                }
        
                return $tracks;
            }
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function updateImportWarehouseOfShipmentOrder($shipmentID, $importWarehouseID)
    {
        $shipmentOrderUpdateRequest = new ShipmentOrderImportWarehouseUpdateRequest();

        $shipmentOrderUpdateRequest->setId($shipmentID);
        $shipmentOrderUpdateRequest->setImportWarehouseID($importWarehouseID);

        $this->shipmentOrderManager->updateImportWarehouseOfShipmentOrder($shipmentOrderUpdateRequest);
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->trackEntityRepository->getByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function checkIfExternalWarehouseAndFCLHolder($shipmentID, $holderType, $holderID)
    {
        $holder = [];

        $shipment = $this->shipmentOrderManager->getShipmentOrderById($shipmentID);

        if($holderType == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
        {
            $holder = $this->getAirwaybillById($holderID);
        }
        elseif($holderType == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
        {
            $holder = $this->getContainerById($holderID);
        }

        if($shipment['isExternalWarehouse'] == true && $holder['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
        {
            return true;
        }

        return false;
    }
    
    public function checkIfHolderIsFCLByHolderTypeAndHolderID($holderType, $holderID)
    {
        if($holderType == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
        {
            $holder = $this->getAirwaybillById($holderID);
        }
        elseif($holderType == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
        {
            $holder = $this->getContainerById($holderID);
        }

        if($holder['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
        {
            return true;
        }
        elseif($holder['type'] == ShippingTypeConstant::$LCL_SHIPPING_TYPE)
        {
            return false;
        }
    }

    public function createShipmentLog($shipmentID, $trackNumber, $shipmentStatus, $createdBy)
    {
        $request = new ShipmentLogCreateRequest();

        $request->setShipmentID($shipmentID);
        $request->setTrackNumber($trackNumber);
        $request->setShipmentStatus($shipmentStatus);
        $request->setCreatedBy($createdBy);

        $this->shipmentLogManager->create($request);
    }

    public function getContainerById($id)
    {
        return $this->containerManager->getContainerById($id);
    }

    public function getAirwaybillById($id)
    {
        return $this->airwaybillManager->getAirwaybillById($id);
    }

    public function getTracksByTravelID($travelID)
    {
        $holders = [];

        $tracks = $this->trackEntityRepository->getTracksByTravelID($travelID);
        
        // Get the containers/air waybills information
        if($tracks)
        {
            // Call getUniqueHolders function to only get unique holders
            $holders = $this->getUniqueHolders($tracks);

            foreach($holders as $key=>$val)
            {
                if($val['holderType'] == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
                {
                    // Get container info and added them to the holder record
                    $container = $this->containerManager->getContainerById($holders[$key]['holderID']);

                    if($container)
                    {
                        if($container['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
                        {
                            if($container['consigneeID'] == null)
                            {
                                $container['consigneeName'] = $container['consignee'];
                            }
                        }

                        foreach ($container as $index=>$value)
                        {
                            $holders[$key][$index] = $value;
                        }
                    }

                    // Get the shipments stored in the container
                    $holders[$key]['shipments'] = $this->trackEntityRepository->getByHolderTypeAndHolderID($holders[$key]['holderType'], $holders[$key]['holderID']);

                    // Get total gunny used for all shipments of the container
                    $holders[$key]['totalGunny'] = $this->getTotalGunnyOfShipmentsByContainerID($holders[$key]['holderID']);

                    // Get total shipments quantity
                    $holders[$key]['totalReceivedShipmentsQuantity'] = $this->getTotalReceivedShipmentsQuantityByContainerID($holders[$key]['holderID']);

                }
                if($val['holderType'] == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
                {
                    // Get air waybill info and added them to the holder record
                    $airwaybill = $this->airwaybillManager->getAirwaybillById($holders[$key]['holderID']);

                    if($airwaybill)
                    {
                        if($airwaybill['type'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
                        {
                            if($airwaybill['consigneeID'] == null)
                            {
                                $airwaybill['consigneeName'] = $airwaybill['consignee'];
                            }
                        }

                        foreach ($airwaybill as $index=>$value)
                        {
                            $holders[$key][$index] = $value;
                        }
                    }

                    // Get the shipments stored in the air waybill
                    $holders[$key]['shipments'] = $this->trackEntityRepository->getByHolderTypeAndHolderID($holders[$key]['holderType'], $holders[$key]['holderID']);

                    // Get total gunny used for all shipments of the air waybill
                    $holders[$key]['totalGunny'] = $this->getTotalGunnyOfShipmentsByAirWaybillID($holders[$key]['holderID']);

                    // Get total shipments quantity
                    $holders[$key]['totalReceivedShipmentsQuantity'] = $this->getTotalReceivedShipmentsQuantityByAirWaybillID($holders[$key]['holderID']);
                }
            }
        }
        
        return $holders;
    }

    public function getUniqueHolders($tracks)
    {
        $holders = [];

        if($tracks)
        {
            $holders[] = $tracks[0];

            foreach ($tracks as $track)
            {
                $result = $this->checkIfObjectIsInArray($track, $holders, "holderType", "holderID");

                if($result >= 0)
                {
                    // Do not added the item
                }
                elseif($result == -1)
                {
                    $holders[] = $track;
                }
            }
        }

        return $holders;
    }

    public function checkIfObjectIsInArray($object, $array, $objectKeyOne, $objectKeyTwo)
    {
        foreach($array as $key => $value)
        {
            if($object[$objectKeyOne] == $value[$objectKeyOne] && $object[$objectKeyTwo] == $value[$objectKeyTwo])
            {
                return $key;
            }
        }

        return -1;
    }

    // For Get container/air waybill by ID
    public function getTracksByHolderTypeAndHolderID($holderType, $holderID)
    {
        $tracks = $this->trackEntityRepository->getTracksByHolderTypeAndHolderID($holderType, $holderID);

        if($tracks)
        {
            foreach($tracks as $key => $val)
            {
                $tracks[$key]['receivedShipmentQuantity'] = $this->receivedShipmentManager->getReceivedShipmentQuantityByShipmentID($val['shipmentID']);
            }
        }

        return $tracks;
    }

    // For filter container fcl finances / air waybill fcl finances
    public function getByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->trackEntityRepository->getByHolderTypeAndHolderID($holderType, $holderID);
    }

    // For create container / air waybill FCL finance
    public function getOneOrNullTrackByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->trackEntityRepository->getOneOrNullTrackByHolderTypeAndHolderID($holderType, $holderID);
    }

    public function checkHolderAvailability(CheckHolderRequest $request)
    {
        // Fist check the holder type then the status of the holder if it is full or not yes
        if($request->getHolderType() == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
        {
            $container = $this->getContainerById($request->getHolderID());
            
            if($container)
            {   
                if($container['status'] == HolderStatusConstant::$FULL_HOLDER_STATUS)
                {
                    return "Required container is full!";
                }
                elseif($container['status'] == HolderStatusConstant::$NOTFULL_HOLDER_STATUS)
                {
                    // Now while the container is not full, check if required to store the shipment in only one container.
                    if($request->getIsInOneHolder() == true)
                    {
                        // Get current capacity (volume) of the container
                        $currentContainerCapacity = $this->getCurrentCapacityOfContainer($container);
                        
                        // Get the whole volume of the shipment
                        $shipmentVolume = $this->getWholeShipmentAmountByMeasure($request->getShipmentID(), "volume");
                        
                        // Compare the two previous values
                        return $this->compareTwoValues($currentContainerCapacity, $shipmentVolume);
                    }
                    elseif($request->getIsInOneHolder() == false)
                    {
                        // Get current capacity (volume) of the container
                        $currentContainerCapacity = $this->getCurrentCapacityOfContainer($container);
                                            
                        // Compare the capacity of the container with the amount of the shipment that we want to store
                        return $this->compareTwoValues($currentContainerCapacity, $request->getAmount());
                        
                    }
                }
            }
            else
            {
                return "There is not container with the eneterd ID!";
            }
        }
        elseif($request->getHolderType() == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
        {
            $airwaybill = $this->getAirwaybillById($request->getHolderID());
            
            if($airwaybill)
            {   
                if($airwaybill['status'] == HolderStatusConstant::$FULL_HOLDER_STATUS)
                {
                    return "Required air waybill is full!";
                }
                elseif($airwaybill['status'] == HolderStatusConstant::$NOTFULL_HOLDER_STATUS)
                {
                    // Now while the air waybill is not full, check if required to store the shipment in only one air waybill.
                    if($request->getIsInOneHolder() == true)
                    {
                        // Get current weight (volume) of the air waybill
                        $currentAirwaybillWeight = $this->getCurrentFreeWeightOfAirWaybill($airwaybill);
                        
                        // Get the whole weight of the shipment
                        $shipmentWeight = $this->getWholeShipmentAmountByMeasure($request->getShipmentID(), "weight");
                        
                        // Compare the two previous values
                        return $this->compareTwoValues($currentAirwaybillWeight, $shipmentWeight);
                    }
                    elseif($request->getIsInOneHolder() == false)
                    {
                        // Get current weight (volume) of the air waybill
                        $currentAirwaybillWeight = $this->getCurrentFreeWeightOfAirWaybill($airwaybill);
                                            
                        // Compare the weight of the air waybill with the weight of the shipment that we want to store
                        return $this->compareTwoValues($currentAirwaybillWeight, $request->getAmount());
                        
                    }
                }
            }
            else
            {
                return "There is not air waybill with the eneterd ID!";
            }
        }
    }

    public function getCurrentCapacityOfContainer($container)
    {
        $specification = $this->containerSpecificationManager->getContainerSpecificationById($container['specificationID']);

        if($specification)
        {
            $capacity = $specification['capacityCPM'];
        }
        else
        {
            $capacity = 0;
        }
        
        // First, get all shipments' volumes that stored in the container
        $tracks = $this->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $container['id']);
        
        if(!$tracks)
        {
            // There is not any shipment stored in the container yet. Returned the whole capacity of the container.
            return (float)number_format($capacity, 2);
        }
        else
        {
            // There is/are shipment/s stored into the container already. Sum their volumes.
            $shipmentsVolumes = 0;

            foreach($tracks as $track)
            {
                if($track['isInOneHolder'] == true)
                {
                    $shipmentsVolumes = $shipmentsVolumes + $track['volume'];
                }
                else
                {
                    $shipmentsVolumes = $shipmentsVolumes + $track['amount'];
                }
            }

            return (float)number_format($capacity - $shipmentsVolumes, 2);
        }
    }

    public function getCurrentFreeWeightOfAirWaybill($airWaybill)
    {
        if($airWaybill['weight'])
        {
            $weight = $airWaybill['weight'];
        }
        else
        {
            $weight = 0;
        }

        // First, get all shipments' weight that stored in the air waybill
        $tracks = $this->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybill['id']);

        if(!$tracks)
        {
            // There is not any shipment stored in the air waybill yet. Returned the whole weight of the air waybill.
            return (float)number_format($weight, 2);
        }
        else
        {
            // There is/are shipment/s stored into the air waybill already. Sum their weight.
            $shipmentsWeight = 0;

            foreach($tracks as $track)
            {
                if($track['isInOneHolder'] == true)
                {
                    $shipmentsWeight = $shipmentsWeight + $track['weight'];
                }
                else
                {
                    $shipmentsWeight = $shipmentsWeight + $track['amount'];
                }
            }

            return (float)number_format($weight - $shipmentsWeight, 2);
        }
    }

    public function getWholeShipmentAmountByMeasure($shipmentID, $measure)
    {
        $shipments = $this->shipmentStatusManager->getShipmentOrderByShipmentID($shipmentID);

        if($shipments)
        {
            if($measure = "volume")
            {
                return $shipments[0]['volume'];
            }
            elseif($measure = "weight")
            {
                return $shipments[0]['weight'];
            }
        }
    }

    public function getTotalGunnyOfShipmentsByContainerID($containerID)
    {
        $totalGunny = 0;

        $tracks = $this->trackEntityRepository->getByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($tracks)
        {
            foreach($tracks as $track)
            {
                $totalGunny += $this->gunnyShipmentManager->getGunnyCountByShipmentID($track->getShipmentID());
            }
        }

        return $totalGunny;
    }

    public function getTotalGunnyOfShipmentsByAirWaybillID($airWaybillID)
    {
        $totalGunny = 0;

        $tracks = $this->trackEntityRepository->getByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($tracks)
        {
            foreach($tracks as $track)
            {
                $totalGunny += $this->gunnyShipmentManager->getGunnyCountByShipmentID($track->getShipmentID());
            }
        }

        return $totalGunny;
    }

    public function getTotalReceivedShipmentsQuantityByContainerID($containerID)
    {
        $totalReceivedQuantity = 0;

        $tracks = $this->trackEntityRepository->getByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($tracks)
        {
            foreach($tracks as $track)
            {
                if($track->getAmount())
                {
                    $totalReceivedQuantity += $track->getAmount();
                }
                elseif($track->getAmount() == null)
                {
                    $totalReceivedQuantity += $this->receivedShipmentManager->getReceivedShipmentQuantityByShipmentID($track->getShipmentID());
                }
            }
        }

        return $totalReceivedQuantity;
    }

    public function getTotalReceivedShipmentsQuantityByAirWaybillID($airWaybillID)
    {
        $totalReceivedQuantity = 0;

        $tracks = $this->trackEntityRepository->getByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airWaybillID);

        if($tracks)
        {
            foreach($tracks as $track)
            {
                if($track->getAmount())
                {
                    $totalReceivedQuantity += $track->getAmount();
                }
                elseif($track->getAmount() == null)
                {
                    $totalReceivedQuantity += $this->receivedShipmentManager->getReceivedShipmentQuantityByShipmentID($track->getShipmentID());
                }
            }
        }

        return $totalReceivedQuantity;
    }

    public function compareTwoValues($valueOne, $valueTwo)
    {
        if($valueOne == $valueTwo)
        {
            return "You can only store this shipment into the holder";
        }
        elseif($valueOne - $valueTwo >= $valueTwo)
        {
            return "You can store this shipment completely into the holder";
        }
        elseif($valueOne - $valueTwo <= $valueTwo)
        {
            return "You can store part of this shipment into the holder";
        }
        elseif($valueOne <= $valueTwo)
        {
            return "You can not store this shipment completely into the holder!";
        }
    }
    
    public function checkIfShipmentGoesOnDifferentTravel($shipmentID, $trackNumber, $travelID)
    {
        $tracks = [];

        $tracks = $this->trackEntityRepository->getByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
        if($tracks)
        {
            foreach($tracks as $track)
            {
                if($track['travelID'] != $travelID)
                {
                    return true;
                }
            }

            return false;
        }
        else
        {
            return false;
        }
    }

    public function deleteAllTracks()
    {
        return $this->trackEntityRepository->deleteAllTracks();
    }

}