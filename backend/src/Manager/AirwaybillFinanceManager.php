<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\HolderTypeConstant;
use App\Entity\AirwaybillFinanceEntity;
use App\Repository\AirwaybillFinanceEntityRepository;
use App\Request\AirwaybillDistributeStatusCostRequest;
use App\Request\AirwaybillFinanceCreateRequest;
use App\Request\AirwaybillFinanceFilterRequest;
use App\Request\ShipmentFinanceCreateRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $airwaybillFinanceEntityRepository;
    private $trackManager;
    private $shipmentFinanceManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillFinanceEntityRepository $airwaybillFinanceEntityRepository, 
     TrackManager $trackManager, ShipmentFinanceManager $shipmentFinanceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillFinanceEntityRepository = $airwaybillFinanceEntityRepository;
        $this->trackManager = $trackManager;
        $this->shipmentFinanceManager = $shipmentFinanceManager;
    }

    public function create(AirwaybillFinanceCreateRequest $request)
    {
        $airwaybillFinanceEntity = $this->autoMapping->map(AirwaybillFinanceCreateRequest::class, AirwaybillFinanceEntity::class, $request);

        $this->entityManager->persist($airwaybillFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $airwaybillFinanceEntity;
    }

    public function getCurrentTotalCostByFilterOptions($airwaybillID, $status)
    {
        return $this->airwaybillFinanceEntityRepository->getCurrentTotalCostByFilterOptions($airwaybillID, $status);
    }

    public function filterAirwaybillFinances(AirwaybillFinanceFilterRequest $request)
    {
        $airwaybillFinances['airwaybillFinances'] = $this->airwaybillFinanceEntityRepository->filterAirwaybillFinances($request->getAirwaybillID(), $request->getStatus());

        $currentTotalCost = $this->getCurrentTotalCostByFilterOptions($request->getAirwaybillID(), $request->getStatus())['currentTotalCost'];

        if($currentTotalCost)
        {
            $airwaybillFinances['currentTotalCost'] = $currentTotalCost;
        }
        else
        {
            $airwaybillFinances['currentTotalCost'] = 0;
        }

        return $airwaybillFinances;
    }

    public function distributeAirwaybillCost(AirwaybillDistributeStatusCostRequest $request)
    {
        // get all shipments stored in the air waybill
        $tracks = $this->trackManager->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $request->getAirwaybillID());
        
        if($tracks)
        {
            foreach($tracks as $track)
            {
                // check if shimpent finance of the specific holder and status is exist
                $shipmentFinances = $this->shipmentFinanceManager->getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($track['shipmentID'], $track['trackNumber'],
                HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE, $request->getAirwaybillID(), $request->getStatus());
            
                if($shipmentFinances)
                {
                    // Update the costs of the shipments
                    foreach($shipmentFinances as $shipmentFinance)
                    {
                        // check the volume of the shipment which is stored into the air waybill
                        if($track['isInOneHolder'])
                        {
                            // The shipment is stored completely in the air waybill => use the whole shipment volume in finding the cost according to the formula:
                            // shipment cost = weight X price of 1 kilogram 
                            $shipmentCost = $track['weight'] * 10;

                            $this->updateShipmentFinanceByAirwaybill($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                        else
                        {
                            // Part of the shipment is stored in the air waybill => use the shipment's volume which is entered in the amount field.
                            // shipment cost = weight X price of 1 kilogram 
                            $shipmentCost = $track['weight'] * 10;

                            $this->updateShipmentFinanceByAirwaybill($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                    }
                }
                else
                {
                    // check the volume of the shipment which is stored into the air waybill
                    if($track['isInOneHolder'])
                    {
                        // The shipment is stored completely in the air waybill => use the whole shipment volume in finding the cost according to the formula:
                        // shipment cost = weight X price of 1 kilogram 
                        $shipmentCost = $track['weight'] * 10;

                        $this->createShipmentFinanceByAirwaybill($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                    else
                    {
                        // Part of the shipment is stored in the air waybill => use the shipment's volume which is entered in the amount field.
                        // shipment cost = weight X price of 1 kilogram 
                        $shipmentCost = $track['weight'] * 10;

                        $this->createShipmentFinanceByAirwaybill($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                }
            }

            return $tracks;
        }
        else
        {
            return "There is not any shipment stored in the air waybill!";
        }
    }

    public function createShipmentFinanceByAirwaybill(AirwaybillDistributeStatusCostRequest $request, $shipmentID, $trackNumber, $stageCost)
    {
        $shipmentFinanceRequest = new ShipmentFinanceCreateRequest();

        $shipmentFinanceRequest->setShipmentID($shipmentID);
        $shipmentFinanceRequest->setTrackNumber($trackNumber);

        $shipmentFinanceRequest->setHolderType(HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE);

        $shipmentFinanceRequest->setHolderID($request->getAirwaybillID());
        $shipmentFinanceRequest->setShipmentStatus($request->getStatus());
        $shipmentFinanceRequest->setCreatedBy($request->getCreatedBy());
        $shipmentFinanceRequest->setCurrency($request->getCurrency());

        $shipmentFinanceRequest->setStageCost($stageCost);
        
        $this->shipmentFinanceManager->create($shipmentFinanceRequest);
    }

    public function updateShipmentFinanceByAirwaybill($shipmentFinanceArray, $updatedBy, $shipmentCost)
    {
        $shipmentFinanceUpdateRequest = $this->autoMapping->map('array', ShipmentFinanceUpdateRequest::class, $shipmentFinanceArray);
        
        $shipmentFinanceUpdateRequest->setUpdatedBy($updatedBy);
        $shipmentFinanceUpdateRequest->setStageCost($shipmentCost);
        
        $this->shipmentFinanceManager->update($shipmentFinanceUpdateRequest);
    }

    public function deleteAllAirwaybillsFinances()
    {
        return $this->airwaybillFinanceEntityRepository->deleteAllAirwaybillsFinances();
    }

}