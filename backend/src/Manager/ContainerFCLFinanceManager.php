<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerFCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\PaymentTypeConstant;
use App\Constant\ShipmentOrderPaymentTypeConstant;
use App\Entity\ContainerFCLFinanceEntity;
use App\Repository\ContainerFCLFinanceEntityRepository;
use App\Request\ContainerDistributeStatusCostRequest;
use App\Request\ContainerFCLFinanceCreateRequest;
use App\Request\ContainerFCLFinanceFilterRequest;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerFCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $trackManager;
    private $shipmentFinanceManager;
    private $shipmentOrderManager;
    private $containerManager;
    private $containerSpecificationPriceManager;
    private $containerFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerFCLFinanceEntityRepository $containerFCLFinanceEntityRepository, TrackManager $trackManager,
                                ShipmentLCLFinanceManager $shipmentFinanceManager, ShipmentOrderManager $shipmentOrderManager, ContainerManager $containerManager, ContainerSpecificationPriceManager $containerSpecificationPriceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackManager = $trackManager;
        $this->shipmentFinanceManager = $shipmentFinanceManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->containerManager = $containerManager;
        $this->containerSpecificationPriceManager = $containerSpecificationPriceManager;
        $this->containerFinanceEntityRepository = $containerFCLFinanceEntityRepository;
    }

    public function create(ContainerFCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), ContainerFCLFinancialStatusConstant::$FCL_CONTAINER_FINANCIAL_STATUS_ARRAY))
        {
            $containerFCLFinanceEntity = $this->autoMapping->map(ContainerFCLFinanceCreateRequest::class, ContainerFCLFinanceEntity::class, $request);

            $containerFCLFinanceEntity->setTrackNumber($this->getTrackNumberByContainerID($request->getContainerID()));
            $containerFCLFinanceEntity->setImportWarehouseID($this->getImportWarehouseIdByContainerID($request->getContainerID()));
            $containerFCLFinanceEntity->setClientUserID($this->getClientUserIdByContainerID($request->getContainerID()));
            $containerFCLFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
            $containerFCLFinanceEntity->setProxyID($this->getProxyIdByContainerID($request->getContainerID()));

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

    public function getTrackNumberByContainerID($containerID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($track)
        {
            return $track->getTrackNumber();
        }
    }

    public function getImportWarehouseIdByContainerID($containerID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($track)
        {
            return $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($track->getShipmentID());
        }
    }

    public function getClientUserIdByContainerID($containerID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($track)
        {
            return $this->shipmentOrderManager->getClientUserIdByShipmentOrderID($track->getShipmentID());
        }
    }

    public function getShipmentIdByContainerID($containerID)
    {
        $track = $this->trackManager->getOneOrNullTrackByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($track)
        {
            return $track->getShipmentID();
        }
    }

    public function getCurrentTotalBuyingCostByFilterOptions($containerID, $status)
    {
        return $this->containerFinanceEntityRepository->getCurrentTotalBuyingCostByFilterOptions($containerID, $status);
    }

    public function getCurrentTotalSellingCostByFilterOptions($containerID, $status)
    {
        return $this->containerFinanceEntityRepository->getCurrentTotalSellingCostByFilterOptions($containerID, $status);
    }

    public function getContainerFCLTotalSellingCostByShipmentID($shipmentID)
    {
        return $this->containerFinanceEntityRepository->getContainerFCLTotalSellingCostByShipmentID($shipmentID);
    }

    public function getContainerFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->containerFinanceEntityRepository->getContainerFCLBillDetailsByShipmentID($shipmentID);
    }

    public function getContainerFCLBuyingDetailsByShipmentID($shipmentID)
    {
        return $this->containerFinanceEntityRepository->getContainerFCLBuyingDetailsByShipmentID($shipmentID);
    }

    public function filterContainerFCLFinances(ContainerFCLFinanceFilterRequest $request)
    {
        $containerFinances['containerFinances'] = $this->containerFinanceEntityRepository->filterContainerFCLFinances($request->getContainerID(), $request->getStatus());

        // Get stored shipment info (ID + trackNumber) in the container
        if($containerFinances['containerFinances'])
        {
            foreach($containerFinances['containerFinances'] as $key => $value)
            {
                $containerFinances['containerFinances'][$key]['shipmentInfo'] = $this->trackManager->getByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $value['containerID']);

                $containerFinances['containerFinances'][$key]['price'] = $this->getContainerSpecificationPriceByContainerID($value['containerID']);

                $containerFinances['price'] = $this->getContainerSpecificationPriceByContainerID($value['containerID']);
            }
        }

        // Get current total buying cost
        $currentTotalBuyingCost = $this->getCurrentTotalBuyingCostByFilterOptions($request->getContainerID(), $request->getStatus())['currentTotalBuyingCost'];

        if($currentTotalBuyingCost)
        {
            $containerFinances['currentTotalBuyingCost'] = $currentTotalBuyingCost;
        }
        else
        {
            $containerFinances['currentTotalBuyingCost'] = 0;
        }

        // Get current total selling cost
        $currentTotalSellingCost = $this->getCurrentTotalSellingCostByFilterOptions($request->getContainerID(), $request->getStatus())['currentTotalSellingCost'];

        if($currentTotalSellingCost)
        {
            $containerFinances['currentTotalSellingCost'] = $currentTotalSellingCost;
        }
        else
        {
            $containerFinances['currentTotalSellingCost'] = 0;
        }

        return $containerFinances;
    }

    public function getProxyIdByContainerID($containerID)
    {
        $shipmentID = $this->getShipmentIdByContainerID($containerID);

        $shipmentOrder = $this->shipmentOrderManager->getPaymentTimeAndImportAndExportProxiesIDsByShipmentOrderID($shipmentID);

        if($shipmentOrder)
        {
            if($shipmentOrder['paymentTime'] == ShipmentOrderPaymentTypeConstant::$COLLECT_PAYMENT_TYPE)
            {
                return $shipmentOrder['importProxyID'];
            }
            elseif($shipmentOrder['paymentTime'] == ShipmentOrderPaymentTypeConstant::$PREPAID_PAYMENT_TYPE)
            {
                if($shipmentOrder['exportProxyID'])
                {
                    return $shipmentOrder['exportProxyID'];
                }
                else
                {
                    // Return the agent (proxy) of the export warehouse of the Container
                    $result = $this->containerManager->getProxyIdOfExportWarehouseByContainerID($containerID);

                    if($result)
                    {
                        return $result['exportProxyID'];
                    }
                }
            }
        }
    }

    // not used anymore
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

    // not used anymore
    public function createShipmentFinanceByContainer(ContainerDistributeStatusCostRequest $request, $shipmentID, $trackNumber, $stageCost)
    {
        $shipmentFinanceRequest = new ShipmentLCLFinanceCreateRequest();

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

    // not used anymore
    public function updateShipmentFinanceByContainer($shipmentFinanceArray, $updatedBy, $shipmentCost)
    {
        $shipmentFinanceUpdateRequest = $this->autoMapping->map('array', ShipmentFinanceUpdateRequest::class, $shipmentFinanceArray);
        
        $shipmentFinanceUpdateRequest->setUpdatedBy($updatedBy);
        $shipmentFinanceUpdateRequest->setStageCost($shipmentCost);
        
        $this->shipmentFinanceManager->update($shipmentFinanceUpdateRequest);
    }

    public function getContainerSpecificationPriceByContainerID($containerID)
    {
        $containerResult = $this->containerManager->getSpecificationIdAndExportCountryAndExportCityAndPortIdByContainerID($containerID);

        if($containerResult)
        {
            $priceResult = $this->containerSpecificationPriceManager->getContainerSpecificationPriceBySpecificationIdAndExportCountryIdAndExportCityAndDestinationPortID($containerResult['specificationID'],
                $containerResult['exportCountryID'], $containerResult['exportCity'], $containerResult['portID']);

            if($priceResult)
            {
                return $priceResult['price'];
            }
        }

        return 0;
    }

    public function deleteAllContainersFCLFinances()
    {
        return $this->containerFinanceEntityRepository->deleteAllContainersFCLFinances();
    }

}