<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ServicesEntity;
use App\Repository\ServicesEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ServiceCreateRequest;
use App\Request\ServiceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ServicesManager
{
    private $autoMapping;
    private $entityManager;
    private $servicesEntityRepository;
    private $subcontractManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ServicesEntityRepository $servicesEntityRepository,
     SubcontractManager $subcontractManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->servicesEntityRepository = $servicesEntityRepository;
        $this->subcontractManager = $subcontractManager;
    }

    public function create(ServiceCreateRequest $request)
    {
        $serviceEntity = $this->autoMapping->map(ServiceCreateRequest::class, ServicesEntity::class, $request);

        $this->entityManager->persist($serviceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $serviceEntity;
    }

    public function update(ServiceUpdateRequest $request)
    {
        $serviceEntity = $this->servicesEntityRepository->find($request->getId());
        
        if(!$serviceEntity)
        {
            return null;
        }
        else
        {
            $serviceEntity = $this->autoMapping->mapToObject(ServiceUpdateRequest::class, ServicesEntity::class, $request, $serviceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $serviceEntity;
        }
    }
    
    public function getServiceById($serviceID)
    {
        return $this->servicesEntityRepository->getServiceById($serviceID);
    }

    public function getAllServices()
    {
        return $this->servicesEntityRepository->getAllServices();
    }

    public function delete(DeleteRequest $request)
    {
        $serviceEntity = $this->servicesEntityRepository->find($request->getId());

        if(!$serviceEntity )
        {

        }
        else
        {
            // check if the service is not being used before
            $subcontracts = $this->subcontractManager->getSubcontractsByServiceID($request->getId());

            if($subcontracts)
            {
                return "Can't delete the service. It's used!";
            }
            else
            {
                $this->entityManager->remove($serviceEntity);
                $this->entityManager->flush();
            }
        }

        return $serviceEntity;
    }

}