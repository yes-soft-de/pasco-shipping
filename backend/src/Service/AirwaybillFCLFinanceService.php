<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\AirwaybillFCLFinancialStatusConstant;
use App\Entity\AirwaybillFCLFinanceEntity;
use App\Manager\AirwaybillFCLFinanceManager;
use App\Request\AirwaybillDistributeStatusCostRequest;
use App\Request\AirwaybillFCLFinanceCreateRequest;
use App\Request\AirwaybillFCLFinanceFilterRequest;
use App\Request\ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest;
use App\Response\AirwaybillFCLFinanceCreateResponse;
use App\Response\AirwaybillFCLFinanceGetResponse;
use App\Response\DeleteAllGetResponse;
use App\Response\TrackByHolderTypeAndHolderIdGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AirwaybillFCLFinanceService
{
    private $autoMapping;
    private $airwaybillFCLFinanceManager;
    private $shipmentInvoiceService;
    private $params;

    public function __construct(AutoMapping $autoMapping, AirwaybillFCLFinanceManager $airwaybillFCLFinanceManager, ParameterBagInterface $params,
     ShipmentInvoiceService $shipmentInvoiceService)
    {
        $this->autoMapping = $autoMapping;
        $this->airwaybillFCLFinanceManager = $airwaybillFCLFinanceManager;
        $this->shipmentInvoiceService = $shipmentInvoiceService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(AirwaybillFCLFinanceCreateRequest $request)
    {
        $airwaybillFCLFinanceEntity = $this->airwaybillFCLFinanceManager->create($request);

        if($airwaybillFCLFinanceEntity instanceof AirwaybillFCLFinanceEntity)
        {
            if($request->getSellingCost())
            {
                /**
                 * Check if shipment has a previous invoice, if it does, then updated the total cost
                 * If it does not have an invoice, then do nothing
                 */
                $invoice = $this->shipmentInvoiceService->getShipmentInvoiceIdByShipmentID($this->getShipmentIdByAirWaybillID($request->getAirwaybillID()));

                if($invoice)
                {
                    $this->updateShipmentInvoiceTotalCostAndBillDetailsAndBuyingDetailsByInvoiceIdAndShipmentID($this->getShipmentIdByAirWaybillID($request->getAirwaybillID()), $invoice->id);
                }
            }

            return $this->autoMapping->map(AirwaybillFCLFinanceEntity::class, AirwaybillFCLFinanceCreateResponse::class, $airwaybillFCLFinanceEntity);
        }

        return $airwaybillFCLFinanceEntity;
    }

    public function updateShipmentInvoiceTotalCostAndBillDetailsAndBuyingDetailsByInvoiceIdAndShipmentID($shipmentID, $invoiceID)
    {
        $invoiceUpdateRequest = new ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest();

        $invoiceUpdateRequest->setId($invoiceID);
        $invoiceUpdateRequest->setTotalCost($this->airwaybillFCLFinanceManager->getAirWaybillFCLTotalSellingCostByShipmentID($shipmentID));
        $invoiceUpdateRequest->setBillDetails($this->airwaybillFCLFinanceManager->getAirWaybillFCLBillDetailsByShipmentID($shipmentID));
        $invoiceUpdateRequest->setBuyingDetails($this->airwaybillFCLFinanceManager->getAirWaybillFCLBuyingDetailsByShipmentID($shipmentID));

        $this->shipmentInvoiceService->updateTotalCostAndBillDetailsAndBuyingDetails($invoiceUpdateRequest);
    }

    public function getShipmentIdByAirWaybillID($airWaybillID)
    {
        return $this->airwaybillFCLFinanceManager->getShipmentIdByAirWaybillID($airWaybillID);
    }

    public function filterAirWaybillFCLFinances(AirwaybillFCLFinanceFilterRequest $request)
    {
        $airwaybillFinances = $this->airwaybillFCLFinanceManager->filterAirWaybillFCLFinances($request);
        
        foreach($airwaybillFinances['airwaybillFinances'] as $airwaybillFinance)
        {
            if($airwaybillFinance['createdByUserImage'])
            {
                $airwaybillFinance['createdByUserImage'] = $this->params . $airwaybillFinance['createdByUserImage'];
            }

            if($airwaybillFinance['updatedByUserImage'])
            {
                $airwaybillFinance['updatedByUserImage'] = $this->params . $airwaybillFinance['updatedByUserImage'];
            }
        }

        return $this->autoMapping->map('array', AirwaybillFCLFinanceGetResponse::class, $airwaybillFinances);
    }

    // Not used any more
    public function distributeAirwaybillCost(AirwaybillDistributeStatusCostRequest $request)
    {
        $tracksResponse = [];
        
        $tracks = $this->airwaybillFCLFinanceManager->distributeAirwaybillCost($request);

        if(is_array($tracks))
        {
            foreach($tracks as $track)
            {
                $tracksResponse[] = $this->autoMapping->map('array', TrackByHolderTypeAndHolderIdGetResponse::class, $track);
            }
        }

        return $tracks;
    }

    public function deleteAllAirWaybillsFCLFinances()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->airwaybillFCLFinanceManager->deleteAllAirWaybillsFCLFinances();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}