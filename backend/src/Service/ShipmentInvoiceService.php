<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentInvoiceEntity;
use App\Manager\ShipmentInvoiceManager;
use App\Request\ShipmentInvoiceCreateRequest;
use App\Request\ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest;
use App\Request\ShipmentInvoiceUpdatePaymentInfoRequest;
use App\Request\ShipmentInvoiceUpdateRequest;
use App\Response\ShipmentInvoiceCreateResponse;
use App\Response\ShipmentInvoiceFilterResponse;
use App\Response\ShipmentInvoiceIDGetResponse;
use App\Response\ShipmentInvoiceUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentInvoiceService
{
    private $autoMapping;
    private $shipmentInvoiceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentInvoiceManager $shipmentInvoiceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentInvoiceManager = $shipmentInvoiceManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipmentInvoiceCreateRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceManager->create($request);

        if($shipmentInvoiceEntity instanceof ShipmentInvoiceEntity)
        {
            return $this->autoMapping->map(ShipmentInvoiceEntity::class, ShipmentInvoiceCreateResponse::class, $shipmentInvoiceEntity);
        }

        return $shipmentInvoiceEntity;
    }

    public function getShipmentFinanceTotalCostByShipmentID($shipmentID)
    {
        return $this->shipmentInvoiceManager->getShipmentFinanceTotalCostByShipmentID($shipmentID);
    }

    public function getShipmentBillDetailsByShipmentID($shipmentID)
    {
        return $this->shipmentInvoiceManager->getShipmentBillDetailsByShipmentID($shipmentID);
    }

    public function getShipmentBuyingDetailsByShipmentID($shipmentID)
    {
        return $this->shipmentInvoiceManager->getShipmentBuyingDetailsByShipmentID($shipmentID);
    }

    public function update(ShipmentInvoiceUpdateRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceManager->update($request);

        if($shipmentInvoiceEntity instanceof ShipmentInvoiceEntity)
        {
            return $this->autoMapping->map(ShipmentInvoiceEntity::class, ShipmentInvoiceUpdateResponse::class, $shipmentInvoiceEntity);
        }

        return $shipmentInvoiceEntity;
    }

    public function updatePaymentInfo(ShipmentInvoiceUpdatePaymentInfoRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceManager->updatePaymentInfo($request);

        if($shipmentInvoiceEntity instanceof ShipmentInvoiceEntity)
        {
            return $this->autoMapping->map(ShipmentInvoiceEntity::class, ShipmentInvoiceUpdateResponse::class, $shipmentInvoiceEntity);
        }

        return $shipmentInvoiceEntity;
    }

    public function updateTotalCostAndBillDetailsAndBuyingDetails(ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest $request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceManager->updateTotalCostAndBillDetailsAndBuyingDetails($request);

        if($shipmentInvoiceEntity instanceof ShipmentInvoiceEntity)
        {
            return $this->autoMapping->map(ShipmentInvoiceEntity::class, ShipmentInvoiceUpdateResponse::class, $shipmentInvoiceEntity);
        }

        return $shipmentInvoiceEntity;
    }

    public function filterShipmentInvoices($request)
    {
        $shipmentInvoicesResponse = [];

        $shipmentInvoices = $this->shipmentInvoiceManager->filterShipmentInvoices($request);

        foreach($shipmentInvoices as $invoice)
        {
            if($invoice['billDetails'])
            {
                foreach ($invoice['billDetails'] as $billDetail)
                {
                    if (key_exists('shipmentStatus', $billDetail))
                    {
                        $invoice['shipmentBillDetails'][] = $billDetail;
                    }
                    else
                    {
                        $invoice['holderBillDetails'][] = $billDetail;
                    }
                }
            }
            else
            {
                $invoice['billDetails'] = [];
            }

            if($invoice['clientImage'])
            {
                $invoice['clientImage'] = $this->params . $invoice['clientImage'];
            }

            if($invoice['createdByUserImage'])
            {
                $invoice['createdByUserImage'] = $this->params . $invoice['createdByUserImage'];
            }

            if($invoice['updatedByUserImage'])
            {
                $invoice['updatedByUserImage'] = $this->params . $invoice['updatedByUserImage'];
            }

            if($invoice['invoiceImage'])
            {
                $invoice['invoiceImage'] = $this->params . $invoice['invoiceImage'];
            }

            if($invoice['receiptImage'])
            {
                $invoice['receiptImage'] = $this->params . $invoice['receiptImage'];
            }

            $shipmentInvoicesResponse[] = $this->autoMapping->map('array', ShipmentInvoiceFilterResponse::class, $invoice);
        }

        return $shipmentInvoicesResponse;
    }

    public function getShipmentInvoiceIdByShipmentID($shipmentID)
    {
        $result = $this->shipmentInvoiceManager->getShipmentInvoiceIdByShipmentID($shipmentID);

        return $this->autoMapping->map('array', ShipmentInvoiceIDGetResponse::class, $result);
    }

    public function delete($request)
    {
        $shipmentInvoiceEntity = $this->shipmentInvoiceManager->delete($request);

        if($shipmentInvoiceEntity instanceof ShipmentInvoiceEntity)
        {
            return $this->autoMapping->map(ShipmentInvoiceEntity::class, ShipmentInvoiceCreateResponse::class, $shipmentInvoiceEntity);
        }
        else
        {
            return $shipmentInvoiceEntity;
        }
    }

}