<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ContainerEntity;
use App\Manager\ContainerManager;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerUpdateRequest;
use App\Response\ContainerCreateResponse;
use App\Response\ContainerGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ContainerService
{
    private $autoMapping;
    private $containerManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ContainerManager $containerManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->containerManager = $containerManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ContainerCreateRequest $request)
    {
        $containerResult = $this->containerManager->create($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerCreateResponse::class, $containerResult);
    }

    public function update(ContainerUpdateRequest $request)
    {
        $containerResult = $this->containerManager->update($request);

        return $this->autoMapping->map(ContainerEntity::class, ContainerGetResponse::class, $containerResult);
    }

    public function getByStatus($status)
    {
        $containersResponse = [];

        $containers = $this->containerManager->getByStatus($status);

        foreach($containers as $container)
        {
            if($container['createdByUserImage'])
            {
                $container['createdByUserImage'] = $this->params . $container['createdByUserImage'];
            }

            if($container['updatedByUserImage'])
            {
                $container['updatedByUserImage'] = $this->params . $container['updatedByUserImage'];
            }

            $containersResponse[] = $this->autoMapping->map('array', ContainerGetResponse::class, $container);
        }

        return $containersResponse;
    }

}