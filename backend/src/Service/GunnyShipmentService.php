<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\GunnyShipmentEntity;
use App\Manager\GunnyShipmentManager;
use App\Request\DeleteRequest;
use App\Request\GunnyShipmentCreateRequest;
use App\Response\GunnyShipmentCreateResponse;
use App\Response\GunnyShipmentDeleteResponse;
use App\Response\GunnyShipmentGetResponse;
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

    public function getGunnyByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $gunnyResponse = [];

        $gunnyResults = $this->gunnyShipmentManager->getGunnyByShipmentIdAndTrackNumber($shipmentID, $trackNumber);

        foreach($gunnyResults as $gunny)
        {
            if($gunny['createdByUserImage'])
            {
                $gunny['createdByUserImage'] = $this->params . $gunny['createdByUserImage'];
            }

            if($gunny['updatedByUserImage'])
            {
                $gunny['updatedByUserImage'] = $this->params . $gunny['updatedByUserImage'];
            }

            $gunnyResponse[] = $this->autoMapping->map('array', GunnyShipmentGetResponse::class, $gunny);
        }

        return $gunnyResponse;
    }

    public function deleteGunnyShipmentById(DeleteRequest $request, $updatedGunnyStatusBy)
    {
        $result = $this->gunnyShipmentManager->deleteGunnyShipmentById($request, $updatedGunnyStatusBy);

        return $this->autoMapping->map(GunnyShipmentEntity::class, GunnyShipmentDeleteResponse::class, $result);
    }

}