<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\GunnyShipmentEntity;
use App\Manager\GunnyShipmentManager;
use App\Request\DeleteRequest;
use App\Request\GunnyShipmentCreateRequest;
use App\Response\GunnyShipmentCreateResponse;
use App\Response\GunnyShipmentDeleteResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class GunnyShipmentService
{
    private $autoMapping;
    private $gunnyShipmentManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, GunnyShipmentManager $gunnyShipmentManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->gunnyShipmentManager = $gunnyShipmentManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(GunnyShipmentCreateRequest $request)
    {
        $gunnyShipmentResult = $this->gunnyShipmentManager->create($request);

        return $this->autoMapping->map('array', GunnyShipmentCreateResponse::class, $gunnyShipmentResult);
    }

    public function deleteGunnyShipmentById(DeleteRequest $request, $updatedGunnyStatusBy)
    {
        $result = $this->gunnyShipmentManager->deleteGunnyShipmentById($request, $updatedGunnyStatusBy);

        return $this->autoMapping->map(GunnyShipmentEntity::class, GunnyShipmentDeleteResponse::class, $result);
    }

}