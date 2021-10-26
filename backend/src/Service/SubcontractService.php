<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SubcontractEntity;
use App\Manager\SubcontractManager;
use App\Request\SubcontractCreateRequest;
use App\Request\SubcontractUpdateRequest;
use App\Response\SubcontractCreateResponse;
use App\Response\SubcontractGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class SubcontractService
{
    private $autoMapping;
    private $subcontractManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, SubcontractManager $subcontractManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->subcontractManager = $subcontractManager;
        
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(SubcontractCreateRequest $request)
    {
        $subcontractResult = $this->subcontractManager->create($request);

        return $this->autoMapping->map(SubcontractEntity::class, SubcontractCreateResponse::class, $subcontractResult);
    }

    public function update(SubcontractUpdateRequest $request)
    {
        $subcontractResult = $this->subcontractManager->update($request);

        return $this->autoMapping->map(SubcontractEntity::class, SubcontractGetResponse::class, $subcontractResult);
    }

    public function getAllSubcontracts()
    {
        $subcontractResponse = [];

        $subcontracts = $this->subcontractManager->getAllSubcontracts();

        foreach ($subcontracts as $subcontract)
        {
            if($subcontract['createdByUserImage'])
            {
                $subcontract['createdByUserImage'] = $this->params . $subcontract['createdByUserImage'];
            }

            if($subcontract['updatedByUserImage'])
            {
                $subcontract['updatedByUserImage'] = $this->params . $subcontract['updatedByUserImage'];
            }

            $subcontractResponse[] = $this->autoMapping->map('array', SubcontractGetResponse::class, $subcontract);
        }

        return $subcontractResponse;
    }

    public function getSubcontractsByServiceID($serviceID)
    {
        $subcontractResponse = [];

        $subcontracts = $this->subcontractManager->getSubcontractsByServiceID($serviceID);

        foreach($subcontracts as $subcontract)
        {
            if($subcontract['createdByUserImage'])
            {
                $subcontract['createdByUserImage'] = $this->params . $subcontract['createdByUserImage'];
            }

            if($subcontract['updatedByUserImage'])
            {
                $subcontract['updatedByUserImage'] = $this->params . $subcontract['updatedByUserImage'];
            }

            $subcontractResponse[] = $this->autoMapping->map('array', SubcontractGetResponse::class, $subcontract);
        }

        return $subcontractResponse;
    }

    public function filterSubcontracts($request)
    {
        $subcontractResponse = [];

        $subcontracts = $this->subcontractManager->filterSubcontracts($request);

        foreach($subcontracts as $subcontract)
        {
            if($subcontract['createdByUserImage'])
            {
                $subcontract['createdByUserImage'] = $this->params . $subcontract['createdByUserImage'];
            }

            if($subcontract['updatedByUserImage'])
            {
                $subcontract['updatedByUserImage'] = $this->params . $subcontract['updatedByUserImage'];
            }

            $subcontractResponse[] = $this->autoMapping->map('array', SubcontractGetResponse::class, $subcontract);
        }

        return $subcontractResponse;
    }

}