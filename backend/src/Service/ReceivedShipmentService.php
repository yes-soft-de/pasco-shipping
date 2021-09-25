<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ReceivedShipmentEntity;
use App\Manager\ReceivedShipmentManager;
use App\Request\ReceivedShipmentCreateRequest;
use App\Response\ReceivedShipmentCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ReceivedShipmentService
{
    private $autoMapping;
    private $receivedShipmentManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ReceivedShipmentManager $receivedShipmentManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->receivedShipmentManager = $receivedShipmentManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ReceivedShipmentCreateRequest $request)
    {
        $proxyResult = $this->receivedShipmentManager->create($request);

        return $this->autoMapping->map(ReceivedShipmentEntity::class, ReceivedShipmentCreateResponse::class, $proxyResult);
    }

}