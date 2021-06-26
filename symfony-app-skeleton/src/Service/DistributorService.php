<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\DistributorEntity;
use App\Manager\DistributorManager;
use App\Request\DistributorCreateRequest;
use App\Request\DistributorUpdateRequest;
use App\Response\DistributorCreateResponse;
use App\Response\DistributorGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class DistributorService
{
    private $autoMapping;
    private $distributorManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, DistributorManager $distributorManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->distributorManager = $distributorManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(DistributorCreateRequest $request)
    {
        $distributorResult = $this->distributorManager->create($request);

        return $this->autoMapping->map(DistributorEntity::class, DistributorCreateResponse::class, $distributorResult);
    }

    public function update(DistributorUpdateRequest $request)
    {
        $distributorResult = $this->distributorManager->update($request);

        return $this->autoMapping->map(DistributorEntity::class, DistributorGetResponse::class, $distributorResult);
    }

    public function getAllDistributors()
    {
        $distributorsResponse = [];

        $distributors = $this->distributorManager->getAllDistributors();

        foreach ($distributors as $distributor)
        {
            if($distributor['createdByUserImage'])
            {
                $distributor['createdByUserImage'] = $this->params . $distributor['createdByUserImage'];
            }

            if($distributor['updatedByUserImage'])
            {
                $distributor['updatedByUserImage'] = $this->params . $distributor['updatedByUserImage'];
            }

            $distributorsResponse[] = $this->autoMapping->map('array', DistributorGetResponse::class, $distributor);
        }

        return $distributorsResponse;
    }

    public function deleteDistributorById($request)
    {
        $result = $this->distributorManager->deleteDistributorById($request);

        return $this->autoMapping->map(DistributorEntity::class, DistributorGetResponse::class, $result);
    }

}