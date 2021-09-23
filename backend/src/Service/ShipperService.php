<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ShipperEntity;
use App\Manager\ShipperManager;
use App\Request\ShipperCreateRequest;
use App\Request\ShipperUpdateRequest;
use App\Response\ShipperCreateResponse;
use App\Response\ShipperGetResponse;
use App\Response\ShipperUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ShipperService
{
    private $autoMapping;
    private $shipperManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ShipperManager $shipperManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->shipperManager = $shipperManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ShipperCreateRequest $request)
    {
        $shipperResult = $this->shipperManager->create($request);

        return $this->autoMapping->map(ShipperEntity::class, ShipperCreateResponse::class, $shipperResult);
    }

    public function update(ShipperUpdateRequest $request)
    {
        $shipperResult = $this->shipperManager->update($request);

        return $this->autoMapping->map(ShipperEntity::class, ShipperUpdateResponse::class, $shipperResult);
    }

    public function getAllShippers()
    {
        $shippersResponse = [];

        $shippers = $this->shipperManager->getAllShippers();

        foreach($shippers as $shipper)
        {
            if($shipper['createdByUserImage'])
            {
                $shipper['createdByUserImage'] = $this->params . $shipper['createdByUserImage'];
            }

            if($shipper['updatedByUserImage'])
            {
                $shipper['updatedByUserImage'] = $this->params . $shipper['updatedByUserImage'];
            }

            $shippersResponse[] = $this->autoMapping->map('array', ShipperGetResponse::class, $shipper);
        }

        return $shippersResponse;
    }

    public function delete($request)
    {
        $result = $this->shipperManager->delete($request);

        if($result instanceof ShipperEntity)
        {
            return $this->autoMapping->map(ShipperEntity::class, ShipperCreateResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

}