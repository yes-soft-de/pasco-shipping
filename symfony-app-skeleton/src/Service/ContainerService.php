<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerEntity;
use App\Manager\ContainerManager;
use App\Request\ContainerCreateRequest;
use App\Response\ContainerCreateResponse;
use App\Response\ContainerGetResponse;

class ContainerService
{
    private $autoMapping;
    private $containerManager;

    public function __construct(AutoMapping $autoMapping, ContainerManager $containerManager)
    {
        $this->autoMapping = $autoMapping;
        $this->containerManager = $containerManager;
    }

    public function create(ContainerCreateRequest $request)
    {
        $containerResult = $this->containerManager->create($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerCreateResponse::class, $containerResult);
    }

    public function getByStatus($status)
    {
        $containersResponse = [];

        $containers = $this->containerManager->getByStatus($status);

        foreach($containers as $container)
        {
            $containersResponse = $this->autoMapping->map('array', ContainerGetResponse::class, $container);
        }

        return $containersResponse;
    }

}