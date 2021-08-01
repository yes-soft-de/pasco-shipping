<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipmentFinanceEntity;
use App\Manager\ShipmentFinanceManager;
use App\Request\ShipmentFinanceCreateRequest;
use App\Response\ShipmentFinanceCreateResponse;
use App\Response\ShipmentFinanceGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipmentFinanceService
{
    private $autoMapping;
    private $shipmentFinanceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipmentFinanceManager $shipmentFinanceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipmentFinanceManager = $shipmentFinanceManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipmentFinanceCreateRequest $request)
    {
        $shipmentFinanceResult = $this->shipmentFinanceManager->create($request);

        return $this->autoMapping->map(ShipmentFinanceEntity::class, ShipmentFinanceCreateResponse::class, $shipmentFinanceResult);
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $shipmentFinanceResponse = [];

        $shipmentFinances = $this->shipmentFinanceManager->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
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

            $shipmentFinanceResponse[] = $this->autoMapping->map('array', ShipmentFinanceGetResponse::class, $shipmentFinance);
        }
        
        return $shipmentFinanceResponse;
    }

}
