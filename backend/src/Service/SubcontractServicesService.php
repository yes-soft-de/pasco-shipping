<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SubcontractServiceEntity;
use App\Manager\SubcontractServiceManager;
use App\Request\SubcontractServiceCreateRequest;
use App\Request\SubcontractServiceUpdateRequest;
use App\Response\SubcontractServiceCreateResponse;
use App\Response\SubcontractServicesGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class SubcontractServicesService
{
    private $autoMapping;
    private $subcontractServiceManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, SubcontractServiceManager $subcontractServiceManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->subcontractServiceManager = $subcontractServiceManager;
        
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(SubcontractServiceCreateRequest $request)
    {
        $subcontractServiceEntity = $this->subcontractServiceManager->create($request);

        return $this->autoMapping->map(SubcontractServiceEntity::class, SubcontractServiceCreateResponse::class, $subcontractServiceEntity);
    }

    public function update(SubcontractServiceUpdateRequest $request)
    {
        $subcontractServiceEntity = $this->subcontractServiceManager->update($request);

        return $this->autoMapping->map(SubcontractServiceEntity::class, SubcontractServicesGetResponse::class, $subcontractServiceEntity);
    }

    public function getSubcontractServiceById($serviceID)
    {
        $subcontractService = $this->subcontractServiceManager->getSubcontractServiceById($serviceID);
            
        $subcontractService['createdByUserImage'] = $this->params . $subcontractService['createdByUserImage'];

        $subcontractService['updatedByUserImage'] = $this->params . $subcontractService['updatedByUserImage'];

        return $this->autoMapping->map('array', SubcontractServicesGetResponse::class, $subcontractService);
    }

    public function getAllSubcontractServices()
    {
        $subcontractServicesResponse = [];

        $subcontractServices = $this->subcontractServiceManager->getAllSubcontractServices();

        foreach ($subcontractServices as $service)
        {
            $service['createdByUserImage'] = $this->params . $service['createdByUserImage'];

            $service['updatedByUserImage'] = $this->params . $service['updatedByUserImage'];
            
            $subcontractServicesResponse[] = $this->autoMapping->map('array', SubcontractServicesGetResponse::class, $service);
        }

        return $subcontractServicesResponse;
    }

    public function delete($services)
    {
        $subcontractServiceEntity = $this->subcontractServiceManager->delete($services);

        if($subcontractServiceEntity instanceof SubcontractServiceEntity)
        {
            return $this->autoMapping->map(SubcontractServiceEntity::class, SubcontractServicesGetResponse::class, $subcontractServiceEntity);
        }

        return $subcontractServiceEntity;
    }

}