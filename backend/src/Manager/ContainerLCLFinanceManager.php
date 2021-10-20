<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerFCLFinancialStatusConstant;
use App\Constant\HolderTypeConstant;
use App\Constant\PaymentTypeConstant;
use App\Entity\ContainerLCLFinanceEntity;
use App\Repository\ContainerLCLFinanceEntityRepository;
use App\Request\ContainerDistributeStatusCostRequest;
use App\Request\ContainerFCLFinanceFilterRequest;
use App\Request\ContainerLCLFinanceCreateRequest;
use App\Request\ContainerLCLFinanceFilterRequest;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentFinanceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerLCLFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $containerLCLFinanceEntityRepository;
    private $trackManager;
    private $shipmentOrderManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerLCLFinanceEntityRepository $containerLCLFinanceEntityRepository, TrackManager $trackManager,
                                ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->trackManager = $trackManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->containerLCLFinanceEntityRepository = $containerLCLFinanceEntityRepository;
    }

    public function create(ContainerLCLFinanceCreateRequest $request)
    {
        if(in_array($request->getStatus(), ContainerFCLFinancialStatusConstant::$FCL_CONTAINER_FINANCIAL_STATUS_ARRAY))
        {
            $containerLCLFinanceEntity = $this->autoMapping->map(ContainerLCLFinanceCreateRequest::class, ContainerLCLFinanceEntity::class, $request);

            $containerLCLFinanceEntity->setPaymentType(PaymentTypeConstant::$CASH_PAYMENT_TYPE);
            $containerLCLFinanceEntity->setProxyID($this->getProxyIdByContainerID($request->getContainerID()));

            $this->entityManager->persist($containerLCLFinanceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerLCLFinanceEntity;
        }
        else
        {
            return "Wrong status!";
        }
    }

    public function getCurrentTotalCostByFilterOptions($containerID, $status)
    {
        return $this->containerLCLFinanceEntityRepository->getCurrentTotalCostByFilterOptions($containerID, $status);
    }

    public function filterContainerLCLFinances(ContainerLCLFinanceFilterRequest $request)
    {
        $containerFinances['containerFinances'] = $this->containerLCLFinanceEntityRepository->filterContainerLCLFinances($request->getContainerID(), $request->getStatus());

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

    public function getProxyIdByContainerID($containerID)
    {
        /**
         * Get the proxy ID of the export warehouse as following:
         * first get one shipment ID of the shipments being stored in the container
         * then get the export warehouse ID of the shipment
         */
        $track = $this->trackManager->getOneTrackByHolderTypeAndHolderID(HolderTypeConstant::$CONTAINER_HOLDER_TYPE, $containerID);

        if($track)
        {
            $result = $this->shipmentOrderManager->getExportProxyIDByShipmentOrderID($track->getShipmentID());

            if($result)
            {
                return $result['exportProxyID'];
            }
        }
    }

    public function deleteAllContainersLCLFinances()
    {
        return $this->containerLCLFinanceEntityRepository->deleteAllContainersFCLFinances();
    }

}