<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ShipmentFinanceEntity;
use App\Repository\ShipmentFinanceEntityRepository;
use App\Request\ShipmentFinanceCreateRequest;
use App\Request\ShipmentFinanceFilterRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentFinanceEntityRepository $shipmentFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentFinanceEntityRepository = $shipmentFinanceEntityRepository;
    }

    public function create(ShipmentFinanceCreateRequest $request)
    {
        $shipmentFinanceEntity = $this->autoMapping->map(ShipmentFinanceCreateRequest::class, ShipmentFinanceEntity::class, $request);

        $this->entityManager->persist($shipmentFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shipmentFinanceEntity;
    }

    public function update(ShipmentFinanceUpdateRequest $request)
    {
        $shipmentFinanceEntity = $this->shipmentFinanceEntityRepository->find($request->getId());

        if(!$shipmentFinanceEntity)
        {

        }
        else
        {
            $shipmentFinanceEntity = $this->autoMapping->mapToObject(ShipmentFinanceUpdateRequest::class, ShipmentFinanceEntity::class, $request, $shipmentFinanceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentFinanceEntity;
        }
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->shipmentFinanceEntityRepository->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID, $containerID, $airwaybillID, $travelID)
    {
        return $this->shipmentFinanceEntityRepository->getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID, 
        $containerID, $airwaybillID, $travelID);
    }

    public function filterShipmentFinances(ShipmentFinanceFilterRequest $request)
    {
        $shipmentFinances['shipmentFinances'] = $this->shipmentFinanceEntityRepository->filterShipmentFinances($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(), 
        $request->getExportWarehouseID(), $request->getImportWarehouseID(), $request->getContainerID(), $request->getAirwaybillID(), $request->getTravelID());
        
        $shipmentFinances['currentTotalCost'] = $this->getCurrentTotalCostByFilterOptions($request->getShipmentID(), $request->getTrackNumber(), $request->getShipmentStatus(), 
        $request->getExportWarehouseID(), $request->getImportWarehouseID(), $request->getContainerID(), $request->getAirwaybillID(), $request->getTravelID())['currentTotalCost'];

        return $shipmentFinances;
    }

    public function getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($shipmentID, $trackNumber, $holderType, $holderID, $shipmentStatus)
    {
        return $this->shipmentFinanceEntityRepository->getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($shipmentID, $trackNumber, $holderType, $holderID, $shipmentStatus);
    }
    
    public function deleteAllShipmentFinances()
    {
        return $this->shipmentFinanceEntityRepository->deleteAllShipmentFinances();
    }

}