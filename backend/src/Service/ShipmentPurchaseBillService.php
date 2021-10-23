<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\ShipmentPurchaseBillManager;
use App\Response\ShipmentPurchaseBillGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentPurchaseBillService
{
    private $autoMapping;
    private $shipmentPurchaseBillManager;

    public function __construct(AutoMapping $autoMapping, ShipmentPurchaseBillManager $shipmentPurchaseBillManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentPurchaseBillManager = $shipmentPurchaseBillManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function getPurchaseBillByShipmentID($shipmentID)
    {
        $purchaseBillResult = $this->shipmentPurchaseBillManager->getPurchaseBillByShipmentID($shipmentID);

        return $this->autoMapping->map('array', ShipmentPurchaseBillGetResponse::class, $purchaseBillResult);
    }

}