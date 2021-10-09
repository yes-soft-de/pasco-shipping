<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentLCLFinanceEntity;
use App\Manager\ShipmentLCLFinanceManager;
use App\Request\ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentLCLFinanceFilterRequest;
use App\Response\DeleteAllGetResponse;
use App\Response\ShipmentLCLFinanceCreateResponse;
use App\Response\ShipmentLCLFinanceGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentLCLFinanceService
{
    private $autoMapping;
    private $shipmentLCLFinanceManager;
    private $shipmentInvoiceService;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentLCLFinanceManager $shipmentLCLFinanceManager, ParameterBagInterface $params,
     ShipmentInvoiceService $shipmentInvoiceService)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentLCLFinanceManager = $shipmentLCLFinanceManager;
        $this->shipmentInvoiceService = $shipmentInvoiceService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipmentLCLFinanceCreateRequest $request)
    {
        $shipmentLCLFinanceResult = $this->shipmentLCLFinanceManager->create($request);

        if($shipmentLCLFinanceResult instanceof ShipmentLCLFinanceEntity)
        {
            /**
             * Check if shipment has a previous invoice, if it does, then updated the total cost
             * If it does not have an invoice, then do nothing
             */
            $invoice = $this->shipmentInvoiceService->getShipmentInvoiceIdByShipmentID($request->getShipmentID());

            if($invoice)
            {
                $this->updateShipmentInvoiceTotalCostByInvoiceID($request->getShipmentID(), $invoice->id);
            }

            return $this->autoMapping->map(ShipmentLCLFinanceEntity::class, ShipmentLCLFinanceCreateResponse::class, $shipmentLCLFinanceResult);
        }

        return $shipmentLCLFinanceResult;
    }

    public function updateShipmentInvoiceTotalCostByInvoiceID($shipmentID, $invoiceID)
    {
        $invoiceUpdateRequest = new ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest();

        $invoiceUpdateRequest->setId($invoiceID);
        $invoiceUpdateRequest->setTotalCost($this->shipmentLCLFinanceManager->getShipmentLCLTotalCostByShipmentID($shipmentID));
        $invoiceUpdateRequest->setBillDetails($this->shipmentLCLFinanceManager->getShipmentLCLBillDetailsByShipmentID($shipmentID));

        $this->shipmentInvoiceService->updateTotalCostAndBillDetails($invoiceUpdateRequest);
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $shipmentFinanceResponse = [];

        $shipmentFinances = $this->shipmentLCLFinanceManager->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
        foreach($shipmentFinances as $shipmentFinance)
        {
            if($shipmentFinance['createdByUserImage'])
            {
                $shipmentFinance['createdByUserImage'] = $this->params . $shipmentFinance['createdByUserImage'];
            }

            if($shipmentFinance['updatedByUserImage'])
            {
                $shipmentFinance['updatedByUserImage'] = $this->params . $shipmentFinance['updatedByUserImage'];
            }

            $shipmentFinanceResponse[] = $this->autoMapping->map('array', ShipmentLCLFinanceGetResponse::class, $shipmentFinance);
        }
        
        return $shipmentFinanceResponse;
    }

    public function filterShipmentLCLFinances(ShipmentLCLFinanceFilterRequest $request)
    {
        $shipmentFinances = $this->shipmentLCLFinanceManager->filterShipmentLCLFinances($request);
        
        foreach($shipmentFinances['shipmentFinances'] as $shipmentFinance)
        {
            if($shipmentFinance['createdByUserImage'])
            {
                $shipmentFinance['createdByUserImage'] = $this->params . $shipmentFinance['createdByUserImage'];
            }

            if($shipmentFinance['updatedByUserImage'])
            {
                $shipmentFinance['updatedByUserImage'] = $this->params . $shipmentFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', ShipmentLCLFinanceGetResponse::class, $shipmentFinances);
    }

    public function deleteAllShipmentLCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->shipmentLCLFinanceManager->deleteAllShipmentLCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}
