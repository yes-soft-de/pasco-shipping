<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SubcontractEntity;
use App\Manager\SubcontractManager;
use App\Request\SubcontractCreateRequest;
use App\Request\SubcontractUpdateRequest;
use App\Response\SubcontractCreateResponse;
use App\Response\SubcontractGetResponse;

class SubcontractService
{
    private $autoMapping;
    private $subcontractManager;

    public function __construct(AutoMapping $autoMapping, SubcontractManager $subcontractManager)
    {
        $this->autoMapping = $autoMapping;
        $this->subcontractManager = $subcontractManager;
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

}