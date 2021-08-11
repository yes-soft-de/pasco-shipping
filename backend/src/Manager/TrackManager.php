<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\HolderStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\ShipmentStatusConstant;
use App\Entity\TrackEntity;
use App\Repository\TrackEntityRepository;
use App\Request\CheckHolderRequest;
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
    private $airwaybillSpecificationManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TrackEntityRepository $trackEntityRepository,
     ShipmentStatusManager $shipmentStatusManager, ContainerManager $containerManager, AirwaybillManager $airwaybillManager, ContainerSpecificationManager $containerSpecificationManager,
     AirwaybillSpecificationManager $airwaybillSpecificationManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackEntityRepository = $trackEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->containerManager = $containerManager;
        $this->containerSpecificationManager = $containerSpecificationManager;
        $this->airwaybillManager = $airwaybillManager;
        $this->airwaybillSpecificationManager = $airwaybillSpecificationManager;
    }

    public function create(TrackCreateRequest $request)
    {
        /**
         * Now, we have to check if the holder is going to uploaded onto different travel or not
         */
        if($request->getDifferentTravel() == true)
        {
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
             * Then, we update the record related to the shipment in the ShipmentStatusEntity when the following coditions
             * are true; the shipment stored completely in one holder OR shipment stored in more than one holder, and the storation 
             * of the final part is finished
             */ 
            if($request->getIsInOneHolder() == true || ($request->getIsInOneHolder() == false && $request->getPacked() == true))
            {
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
            // Secondly, update the status in the ShipmentStatusEntity for all shipments
            foreach($tracks as $track)
            {
                if($track)
                {
                    $shipmentStatusRequest = $this->autoMapping->map(TrackUpdateByHolderTypeAndIdRequest::class, ShipmentStatusOfHolderUpdateRequest::class, $request);

                    $shipmentStatusRequest->setShipmentID($track->getShipmentID());
                    $shipmentStatusRequest->setTrackNumber($track->getTrackNumber());
                    $shipmentStatusRequest->setUpdatedBy($request->getUpdatedBy());

                    $this->shipmentStatusManager->updateShipmentStatusOfSpecificHolder($shipmentStatusRequest);
                }
            }
     
            return $tracks;
        }
    }

    public function updateByTravelID(TrackUpdateByTravelIdRequest $request)
    {
        // First, check the status, if the travel strated or arrived (released) then continue updating the shipments status
        if($request->getShipmentStatus() == ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS || $request->getShipmentStatus() == ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS)
        {
            //Secondly, get shipmentID and trackNumber for eahc shipment in the travel
            $tracks = $this->trackEntityRepository->getByTravelID($request->getTravelID());

            if(!$tracks)
            {
                return $tracks;
            }
            else
            {
                // Thirdly, update the status in the ShipmentStatusEntity for all shipments
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

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->trackEntityRepository->getByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
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
        
        // Get the containers/airwaybills information
        if($tracks)
        {
            // Call getUniqueHolders function to only get unique holders
            $holders = $this->getUniqueHolders($holders, $tracks);
            
            foreach($holders as $key=>$val)
            {  
                if($holders[$key]['holderType'] == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
                {
                    $holders[$key] = array_merge($holders[$key], $this->containerManager->getContainerById($holders[$key]['holderID']));

                    // Get the shipments stored in the container
                    $holders[$key]['shipments'] = $this->trackEntityRepository->getByHolderTypeAndHolderID($holders[$key]['holderType'], $holders[$key]['holderID']);
                }
                if($holders[$key]['holderType'] == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
                {
                    $holders[$key] = array_merge($holders[$key], $this->airwaybillManager->getAirwaybillById($holders[$key]['holderID']));

                    // Get the shipments stored in the air waybill
                    $holders[$key]['shipments'] = $this->trackEntityRepository->getByHolderTypeAndHolderID($holders[$key]['holderType'], $holders[$key]['holderID']);
                }
            }
        }
        
        return $holders;
    }

    public function getUniqueHolders($holders, $tracks)
    {
        if($tracks)
        {
            foreach ($tracks as $key=>$val)
            {
                if(!$holders)
                {
                    // added first holder
                    $holders[$key]['holderType'] = $val['holderType'];
                    $holders[$key]['holderID'] = $val['holderID'];
                }
                else
                {
                    // there is already a holder. Check is the next one is the same
                    foreach ($holders as $holder)
                    {
                        if($holder['holderType'] == $val['holderType'] && $holder['holderID'] == $val['holderID'])
                        {
                            // Do not add the holder
                        }
                        else
                        {
                            $holders[$key]['holderType'] = $val['holderType'];
                            $holders[$key]['holderID'] = $val['holderID'];
                        }
                    }
                }
            }
        }

        return $holders;
    }

    // For Get container/air waybill by ID
    public function getTracksByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->trackEntityRepository->getTracksByHolderTypeAndHolderID($holderType, $holderID);
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
                        $currentAirwaybillWeight = $this->getCurrentWeightOfAirwaybill($airwaybill);
                        
                        // Get the whole weight of the shipment
                        $shipmentWeight = $this->getWholeShipmentAmountByMeasure($request->getShipmentID(), "weight");
                        
                        // Compare the two previous values
                        return $this->compareTwoValues($currentAirwaybillWeight, $shipmentWeight);
                    }
                    elseif($request->getIsInOneHolder() == false)
                    {
                        // Get current weight (volume) of the air waybill
                        $currentAirwaybillWeight = $this->getCurrentWeightOfAirwaybill($airwaybill);
                                            
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

    public function getCurrentWeightOfAirwaybill($airwaybill)
    {
        $specification = $this->airwaybillSpecificationManager->getAirwaybillSpecificationByID($airwaybill['specificationID']);

        if($specification)
        {
            $weight = $specification['weight'];
        }
        
        // First, get all shipments' weight that stored in the air waybill
        $tracks = $this->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $airwaybill['id']);
        
        if(!$tracks)
        {
            // There is not any shipment stored in the air waybill yet. Returned the whole weight of the air waybill.
            return (float)number_format($weight, 2);
        }
        else
        {
            // There is/are shipment/s stored into the air waybill already. Sum their weight.
            $shipmentsWieght = 0;

            foreach($tracks as $track)
            {
                if($track['isInOneHolder'] == true)
                {
                    $shipmentsWieght = $shipmentsWieght + $track['weight'];
                }
                else
                {
                    $shipmentsWieght = $shipmentsWieght + $track['amount'];
                }
            }

            return (float)number_format($weight - $shipmentsWieght, 2);
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
    
    public function deleteAllTracks()
    {
        return $this->trackEntityRepository->deleteAllTracks();
    }

}