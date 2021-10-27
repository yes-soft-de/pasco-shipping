<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentFCLFinanceEntity;
use App\Manager\ShipmentFCLFinanceManager;
use App\Request\ShipmentFCLFinanceCreateRequest;
use App\Request\ShipmentFCLFinanceFilterRequest;
use App\Request\ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest;
use App\Response\DeleteAllGetResponse;
use App\Response\ShipmentFCLFinanceCreateResponse;
use App\Response\ShipmentFCLFinanceGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentFCLFinanceService
{
    private $autoMapping;
    private $shipmentFCLFinanceManager;
    private $shipmentInvoiceService;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentFCLFinanceManager $shipmentFCLFinanceManager, ParameterBagInterface $params,
                                ShipmentInvoiceService $shipmentInvoiceService)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentFCLFinanceManager = $shipmentFCLFinanceManager;
        $this->shipmentInvoiceService = $shipmentInvoiceService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipmentFCLFinanceCreateRequest $request)
    {
        $shipmentFCLFinanceResult = $this->shipmentFCLFinanceManager->create($request);

        if($shipmentFCLFinanceResult instanceof ShipmentFCLFinanceEntity)
        {
            /**
             * Check if shipment has a previous invoice, if it does, then updated the total cost
             * If it does not have an invoice, then do nothing
             */
            $invoice = $this->shipmentInvoiceService->getShipmentInvoiceIdByShipmentID($request->getShipmentID());

            if($invoice)
            {
                $this->updateShipmentInvoiceTotalCostByInvoiceIdAndShipmentID($request->getShipmentID(), $invoice->id);
            }

            return $this->autoMapping->map(ShipmentFCLFinanceEntity::class, ShipmentFCLFinanceCreateResponse::class, $shipmentFCLFinanceResult);
        }

        return $shipmentFCLFinanceResult;
    }

    public function updateShipmentInvoiceTotalCostByInvoiceIdAndShipmentID($shipmentID, $invoiceID)
    {
        $invoiceUpdateRequest = new ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest();

        $invoiceUpdateRequest->setId($invoiceID);
        $invoiceUpdateRequest->setTotalCost($this->shipmentInvoiceService->getShipmentFinanceTotalCostByShipmentID($shipmentID));
        $invoiceUpdateRequest->setBillDetails($this->shipmentInvoiceService->getShipmentBillDetailsByShipmentID($shipmentID));
        $invoiceUpdateRequest->setBuyingDetails($this->shipmentInvoiceService->getShipmentBuyingDetailsByShipmentID($shipmentID));

        $this->shipmentInvoiceService->updateTotalCostAndBillDetailsAndBuyingDetails($invoiceUpdateRequest);
    }

    public function filterShipmentFCLFinances(ShipmentFCLFinanceFilterRequest $request)
    {
        $shipmentFinances = $this->shipmentFCLFinanceManager->filterShipmentFCLFinances($request);

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

        return $this->autoMapping->map('array', ShipmentFCLFinanceGetResponse::class, $shipmentFinances);
    }

    public function deleteAllShipmentFCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->shipmentFCLFinanceManager->deleteAllShipmentFCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}
