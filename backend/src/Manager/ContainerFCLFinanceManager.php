<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerFCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Entity\ContainerFCLFinanceEntity;
use App\Repository\ContainerFCLFinanceEntityRepository;
use App\Request\ContainerDistributeStatusCostRequest;
use App\Request\ContainerFCLFinanceCreateRequest;
use App\Request\ContainerFCLFinanceFilterRequest;
use App\Request\ShipmentFinanceCreateRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerFCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $containerFinanceEntityRepository;
    private $trackManager;
    private $shipmentFinanceManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerFCLFinanceEntityRepository $containerFCLFinanceEntityRepository, TrackManager $trackManager,
                                ShipmentFinanceManager $shipmentFinanceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerFinanceEntityRepository = $containerFCLFinanceEntityRepository;
        $this->trackManager = $trackManager;
        $this->shipmentFinanceManager = $shipmentFinanceManager;
    }

    public function create(ContainerFCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), ContainerFCLFinancialStatusConstant::$FCL_CONTAINER_FINANCIAL_STATUS_ARRAY))
        {
            $containerFCLFinanceEntity = $this->autoMapping->map(ContainerFCLFinanceCreateRequest::class, ContainerFCLFinanceEntity::class, $request);

            $this->entityManager->persist($containerFCLFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerFCLFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function getCurrentTotalCostByFilterOptions($containerID, $status)
    {
        return $this->containerFinanceEntityRepository->getCurrentTotalCostByFilterOptions($containerID, $status);
    }

    public function filterContainerFCLFinances(ContainerFCLFinanceFilterRequest $request)
    {
        $containerFinances['containerFinances'] = $this->containerFinanceEntityRepository->filterContainerFCLFinances($request->getContainerID(), $request->getStatus());
        
        $currentTotalCost = $this->getCurrentTotalCostByFilterOptions($request->getContainerID(), $request->getStatus())['currentTotalCost'];

        if($currentTotalCost)
        {
            $containerFinances['currentTotalCost'] = $currentTotalCost;
        }
        else
        {
            $containerFinances['currentTotalCost'] = 0;
        }

        return $containerFinances;
    }

    public function distributeContainerCost(ContainerDistributeStatusCostRequest $request)
    {
        // get all shipments stored in the container
        $tracks = $this->trackManager->getTracksByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $request->getContainerID());
        
        if($tracks)
        {
            foreach($tracks as $track)
            {
                // check if shimpent finance of the specific holder and status is exist
                $shipmentFinances = $this->shipmentFinanceManager->getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($track['shipmentID'], $track['trackNumber'],
                HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $request->getContainerID(), $request->getStatus());

                if($shipmentFinances)
                {
                    // Update the costs of the shipments
                    foreach($shipmentFinances as $shipmentFinance)
                    {
                        // check the volume of the shipment which is stored into the container
                        if($track['isInOneHolder'])
                        {
                            // The shipment is stored completely in the container => use the whole shipment volume in finding the cost according to the formula:
                            // shipment cost = volume X quantity X price of 1 CPM
                            $shipmentCost = $track['volume'] * $track['quantity'] * 10;

                            $this->updateShipmentFinanceByContainer($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                        else
                        {
                            // Part of the shipment is stored in the container => use the shipment's volume which is entered in the amount field.
                            // shipment cost = volume X quantity X price of 1 CPM
                            $shipmentCost = $track['amount'] * $track['quantity'] * 10;

                            $this->updateShipmentFinanceByContainer($shipmentFinance, $request->getCreatedBy(), $shipmentCost);
                        }
                    }
                }
                else
                {
                    // check the volume of the shipment which is stored into the container
                    if($track['isInOneHolder'])
                    {
                        // The shipment is stored completely in the container => use the whole shipment volume in finding the cost according to the formula:
                        // shipment cost = volume X quantity X price of 1 CPM
                        $shipmentCost = $track['volume'] * $track['quantity'] * 10;

                        $this->createShipmentFinanceByContainer($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                    else
                    {
                        // Part of the shipment is stored in the container => use the shipment's volume which is entered in the amount field.
                        // shipment cost = volume X quantity X price of 1 CPM
                        $shipmentCost = $track['amount'] * $track['quantity'] * 10;

                        $this->createShipmentFinanceByContainer($request, $track['shipmentID'], $track['trackNumber'], $shipmentCost);
                    }
                }
            }

            return $tracks;
        }
        else
        {
            return "There is not any shipment stored in the container!";
        }
    }

    public function createShipmentFinanceByContainer(ContainerDistributeStatusCostRequest $request, $shipmentID, $trackNumber, $stageCost)
    {
        $shipmentFinanceRequest = new ShipmentFinanceCreateRequest();

        $shipmentFinanceRequest->setShipmentID($shipmentID);
        $shipmentFinanceRequest->setTrackNumber($trackNumber);

        $shipmentFinanceRequest->setHolderType(HolderTypeConstant::$CONTAINER_HOLDER_TYPE);

        $shipmentFinanceRequest->setHolderID($request->getContainerID());
        $shipmentFinanceRequest->setShipmentStatus($request->getStatus());
        $shipmentFinanceRequest->setCreatedBy($request->getCreatedBy());
        $shipmentFinanceRequest->setCurrency($request->getCurrency());

        $shipmentFinanceRequest->setStageCost($stageCost);
        
        $this->shipmentFinanceManager->create($shipmentFinanceRequest);
    }

    public function updateShipmentFinanceByContainer($shipmentFinanceArray, $updatedBy, $shipmentCost)
    {
        $shipmentFinanceUpdateRequest = $this->autoMapping->map('array', ShipmentFinanceUpdateRequest::class, $shipmentFinanceArray);
        
        $shipmentFinanceUpdateRequest->setUpdatedBy($updatedBy);
        $shipmentFinanceUpdateRequest->setStageCost($shipmentCost);
        
        $this->shipmentFinanceManager->update($shipmentFinanceUpdateRequest);
    }

    public function deleteAllContainersFCLFinances()
    {
        return $this->containerFinanceEntityRepository->deleteAllContainersFCLFinances();
    }

}