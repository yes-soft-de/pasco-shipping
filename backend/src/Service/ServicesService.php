<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ServicesEntity;
use App\Manager\ServicesManager;
use App\Request\ServiceCreateRequest;
use App\Request\ServiceUpdateRequest;
use App\Response\ServiceCreateResponse;
use App\Response\ServicesGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ServicesService
{
    private $autoMapping;
    private $servicesManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ServicesManager $servicesManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->servicesManager = $servicesManager;
        
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ServiceCreateRequest $request)
    {
        $serviceRegister = $this->servicesManager->create($request);

        return $this->autoMapping->map(ServicesEntity::class, ServiceCreateResponse::class, $serviceRegister);
    }

    public function update(ServiceUpdateRequest $request)
    {
        $serviceResult = $this->servicesManager->update($request);

        return $this->autoMapping->map(ServicesEntity::class, ServicesGetResponse::class, $serviceResult);
    }

    public function getServiceById($serviceID)
    {
        $service = $this->servicesManager->getServiceById($serviceID);
            
        $service['createdByUserImage'] = $this->params . $service['createdByUserImage'];

        $service['updatedByUserImage'] = $this->params . $service['updatedByUserImage'];

        return $this->autoMapping->map('array', ServicesGetResponse::class, $service);
    }

    public function getAllServices()
    {
        $servicesResponse = [];

        $services = $this->servicesManager->getAllServices();

        foreach ($services as $service)
        {
            $service['createdByUserImage'] = $this->params . $service['createdByUserImage'];

            $service['updatedByUserImage'] = $this->params . $service['updatedByUserImage'];
            
            $servicesResponse[] = $this->autoMapping->map('array', ServicesGetResponse::class, $service);
        }

        return $servicesResponse;
    }

    public function delete($services)
    {
        $serviceResult = $this->servicesManager->delete($services);

        if($serviceResult instanceof ServicesEntity)
        {
            return  $this->autoMapping->map(ServicesEntity::class, ServicesGetResponse::class, $serviceResult);
        }
        else
        {
            return $serviceResult;
        }
    }

}