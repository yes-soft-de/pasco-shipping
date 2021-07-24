<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Constant\ShipmentStatusConstant;
use App\Entity\TrackEntity;
use App\Repository\TrackEntityRepository;
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
    private $airwaybillManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, TrackEntityRepository $trackEntityRepository,
     ShipmentStatusManager $shipmentStatusManager, ContainerManager $containerManager, AirwaybillManager $airwaybillManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackEntityRepository = $trackEntityRepository;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->containerManager = $containerManager;
        $this->airwaybillManager = $airwaybillManager;
    }

    public function create(TrackCreateRequest $request)
    {
        // First, we insert new raw in the TrackEntity
        $trackEntity = $this->autoMapping->map(TrackCreateRequest::class, TrackEntity::class, $request);
        
        $this->entityManager->persist($trackEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Then, we update the record related to the shipment in the ShipmentStatusEntity
        $shipmentStatusRequest = $this->autoMapping->map(TrackCreateRequest::class, ShipmentStatusUpdateByShipmentIdAndTrackNumberRequest::class, $request);

        $shipmentStatusRequest->setUpdatedBy($request->getCreatedBy());

        $this->shipmentStatusManager->updateShipmentStatusByShipmentIdAndTrackNumber($shipmentStatusRequest);

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
            // If the function is called after uploading the holder to a travel, then we update Track entity by entering the travel ID
            if ($request->getShipmentStatus() == ShipmentStatusConstant::$UPLOADED_SHIPMENT_STATUS)
            {
                foreach($tracks as $track)
                {
                    $track = $this->autoMapping->mapToObject(TrackUpdateByHolderTypeAndIdRequest::class, TrackEntity::class, $request, $track);
                    
                    $this->entityManager->flush();
                }
            }

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
        $tracks = $this->trackEntityRepository->getTracksByTravelID($travelID);
        
        // Get the containers/airwaybills information
        if($tracks)
        {
            $index = 0;

            foreach($tracks as $track)
            {
                if($track['holderType'] == HolderTypeConstant::$CONTAINER_HOLDER_TYPE)
                {
                    $tracks[$index][] = $this->containerManager->getContainerById($track['holderID']);
                }
                if($track['holderType'] == HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE)
                {
                    $tracks[$index][] = $this->airwaybillManager->getAirwaybillById($track['holderID']);
                }
                
                $index++;
            }
        }

        return $tracks;
    }

}