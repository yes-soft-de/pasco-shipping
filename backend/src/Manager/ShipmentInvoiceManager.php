<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentInvoicePaymentStatusConstant;
use App\Constant\ShippingTypeConstant;
use App\Constant\ShippingWayConstant;
use App\Entity\ShipmentInvoiceEntity;
use App\Repository\ShipmentInvoiceEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ShipmentInvoiceCreateRequest;
use App\Request\ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest;
use App\Request\ShipmentInvoiceUpdatePaymentInfoRequest;
use App\Request\ShipmentInvoiceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipmentInvoiceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $shipmentLCLFinanceManager;
    private $containerFCLFinanceManager;
    private $airWaybillFCLFinanceManager;
    private $shipmentInvoiceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipmentInvoiceEntityRepository $shipmentInvoiceEntityRepository,
                                ShipmentOrderManager $shipmentOrderManager, ShipmentLCLFinanceManager $shipmentLCLFinanceManager, ContainerFCLFinanceManager $containerFCLFinanceManager,
     AirwaybillFCLFinanceManager $airWaybillFCLFinanceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->shipmentLCLFinanceManager = $shipmentLCLFinanceManager;
        $this->containerFCLFinanceManager = $containerFCLFinanceManager;
        $this->airWaybillFCLFinanceManager = $airWaybillFCLFinanceManager;
        $this->shipmentInvoiceEntityRepository = $shipmentInvoiceEntityRepository;
    }

    public function create(ShipmentInvoiceCreateRequest $request)
    {
        $invoice = $this->getShipmentInvoiceIdByShipmentID($request->getShipmentID());

        if($invoice)
        {
            return $invoice;
        }
        else
        {
            $shipmentInvoiceEntity = $this->autoMapping->map(ShipmentInvoiceCreateRequest::class, ShipmentInvoiceEntity::class, $request);

            $shipmentInvoiceEntity->setPaymentStatus(ShipmentInvoicePaymentStatusConstant::$NOT_PAID_SHIPMENT_INVOICE_PAYMENT_STATUS);
            $shipmentInvoiceEntity->setBillDetails($this->getShipmentBillDetailsByShipmentID($request->getShipmentID()));

            // Check if there is a discount, and update the total cost according to it
            if($request->getDiscount())
            {
                $totalCost = $this->getShipmentFinanceTotalCostByShipmentID($request->getShipmentID());

                $shipmentInvoiceEntity->setTotalCost($totalCost);

                $shipmentInvoiceEntity->setFinalAmount($totalCost - ($totalCost * $request->getDiscount() / 100));
            }
            else
            {
                $shipmentInvoiceEntity->setTotalCost($this->getShipmentFinanceTotalCostByShipmentID($request->getShipmentID()));

                $shipmentInvoiceEntity->setFinalAmount($this->getShipmentFinanceTotalCostByShipmentID($request->getShipmentID()));
            }

            $this->entityManager->persist($shipmentInvoiceEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentInvoiceEntity;
        }
    }

    public function getShipmentFinanceTotalCostByShipmentID($shipmentID)
    {
        //First check if shipment stored in FCL or LCL holder
        $shipmentOrder = $this->shipmentOrderManager->getHolderTypeAndTransportationTypeByShipmentOrderID($shipmentID);

        if($shipmentOrder['holderType'] == ShippingTypeConstant::$LCL_SHIPPING_TYPE)
        {
            // Use shipment lcl finances to calculate the total cost
            return $this->shipmentLCLFinanceManager->getShipmentLCLTotalCostByShipmentID($shipmentID);
        }
        elseif($shipmentOrder['holderType'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
        {
            // Use container / air waybill fcl finances to calculate the total cost
            if($shipmentOrder['transportationType'] == ShippingWayConstant::$SEA_SHIPPING_WAY)
            {
                return $this->containerFCLFinanceManager->getContainerFCLTotalCostByShipmentID($shipmentID);
            }
            elseif($shipmentOrder['transportationType'] == ShippingWayConstant::$AIR_SHIPPING_WAY)
            {
                return $this->airWaybillFCLFinanceManager->getAirWaybillFCLTotalCostByShipmentID($shipmentID);
            }
        }
    }

    public function getShipmentBillDetailsByShipmentID($shipmentID)
    {
        // Get specific status in order to display for the client, as BuyingCost, Clearance, and Other.
        // First check if shipment stored in FCL or LCL holder
        $billDetailsResponse = [];

        $shipmentOrder = $this->shipmentOrderManager->getHolderTypeAndTransportationTypeByShipmentOrderID($shipmentID);

        if($shipmentOrder['holderType'] == ShippingTypeConstant::$LCL_SHIPPING_TYPE)
        {
            $shipmentStatusResults = $this->shipmentLCLFinanceManager->getShipmentLCLBillDetailsByShipmentID($shipmentID);

            if($shipmentStatusResults)
            {
                foreach($shipmentStatusResults as $result)
                {
                    $billDetailsResponse[] = $result;
                }

                return $billDetailsResponse;
            }
        }
        elseif($shipmentOrder['holderType'] == ShippingTypeConstant::$FCL_SHIPPING_TYPE)
        {
            // then we have to get the bill details from the corresponding holder
            if($shipmentOrder['transportationType'] == ShippingWayConstant::$SEA_SHIPPING_WAY)
            {
                $containerStatusResults = $this->containerFCLFinanceManager->getContainerFCLBillDetailsByShipmentID($shipmentID);

                if($containerStatusResults)
                {
                    foreach($containerStatusResults as $result)
                    {
                        $billDetailsResponse[] = $result;
                    }

                    return $billDetailsResponse;
                }
            }
            elseif($shipmentOrder['transportationType'] == ShippingWayConstant::$AIR_SHIPPING_WAY)
            {
                $airWaybillStatusResults = $this->airWaybillFCLFinanceManager->getAirWaybillFCLBillDetailsByShipmentID($shipmentID);

                if($airWaybillStatusResults)
                {
                    foreach($airWaybillStatusResults as $result)
                    {
                        $billDetailsResponse[] = $result;
                    }

                    return $billDetailsResponse;
                }
            }
        }
    }

    public function update(ShipmentInvoiceUpdateRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceEntityRepository->find($request->getId());

        if(!$shipmentInvoiceEntity)
        {
            return "Shipment invoice does not exist!";
        }
        else
        {
            $shipmentInvoiceEntity = $this->autoMapping->mapToObject(ShipmentInvoiceUpdateRequest::class, ShipmentInvoiceEntity::class,
                $request, $shipmentInvoiceEntity);

            // Check if there is a discount, and update the total cost according to it
            if($request->getDiscount() != null)
            {
                $shipmentInvoiceEntity->setFinalAmount($shipmentInvoiceEntity->getTotalCost() - ($shipmentInvoiceEntity->getTotalCost() * $request->getDiscount() / 100));
            }

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentInvoiceEntity;
        }
    }

    public function updatePaymentInfo(ShipmentInvoiceUpdatePaymentInfoRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceEntityRepository->find($request->getId());

        if(!$shipmentInvoiceEntity)
        {
            return "Shipment invoice does not exist!";
        }
        else
        {
            $shipmentInvoiceEntity = $this->autoMapping->mapToObject(ShipmentInvoiceUpdatePaymentInfoRequest::class, ShipmentInvoiceEntity::class,
             $request, $shipmentInvoiceEntity);

            if($request->getPaymentDate())
            {
                $shipmentInvoiceEntity->setPaymentDate($request->getPaymentDate());
            }

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentInvoiceEntity;
        }
    }

    public function updateTotalCostAndBillDetails(ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceEntityRepository->find($request->getId());

        if(!$shipmentInvoiceEntity)
        {
            return "Shipment invoice does not exist!";
        }
        else
        {
            if($shipmentInvoiceEntity->getDiscount())
            {
                $finalAmount = $request->getTotalCost() - ($request->getTotalCost() * $shipmentInvoiceEntity->getDiscount() / 100);
            }

            $shipmentInvoiceEntity = $this->autoMapping->mapToObject(ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest::class, ShipmentInvoiceEntity::class,
                $request, $shipmentInvoiceEntity);

            $shipmentInvoiceEntity->setFinalAmount($finalAmount);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipmentInvoiceEntity;
        }
    }

    public function filterShipmentInvoices($request)
    {
        return $this->shipmentInvoiceEntityRepository->filterShipmentInvoices($request);
    }

    public function getShipmentInvoiceIdByShipmentID($shipmentID)
    {
        return $this->shipmentInvoiceEntityRepository->getShipmentInvoiceIdByShipmentID($shipmentID);
    }

    public function delete(DeleteRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceEntityRepository->find($request->getId());

        if(!$shipmentInvoiceEntity)
        {
            return "No invoice was found!";
        }
        else
        {
            $this->entityManager->remove($shipmentInvoiceEntity);
            $this->entityManager->flush();

            return $shipmentInvoiceEntity;
        }
    }

}