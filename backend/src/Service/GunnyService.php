<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\GunnyEntity;
use App\Manager\GunnyManager;
use App\Request\GunnyCreateRequest;
use App\Response\GunnyCreateResponse;
use App\Response\GunnyDeleteResponse;
use App\Response\GunnyFilterResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class GunnyService
{
    private $autoMapping;
    private $gunnyManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, GunnyManager $gunnyManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->gunnyManager = $gunnyManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(GunnyCreateRequest $request)
    {
        $gunnyResponse = [];

        $gunnyResult = $this->gunnyManager->create($request);

        foreach($gunnyResult as $gunny)
        {
            $gunnyResponse[] = $this->autoMapping->map('array', GunnyCreateResponse::class, $gunny);
        }

        return $gunnyResponse;
    }

    public function filterGunnies($request)
    {
        $gunnyesResponse = [];

        $gunnyes = $this->gunnyManager->filterGunnies($request);

        foreach($gunnyes as $gunny)
        {
            if($gunny['createdByUserImage'])
            {
                $gunny['createdByUserImage'] = $this->params . $gunny['createdByUserImage'];
            }

            $gunnyesResponse[] = $this->autoMapping->map('array', GunnyFilterResponse::class, $gunny);

        }

        return $gunnyesResponse;
    }

    public function deleteGunnyById($request)
    {
        $result = $this->gunnyManager->deleteGunnyById($request);

        return $this->autoMapping->map(GunnyEntity::class, GunnyDeleteResponse::class, $result);
    }

}