<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\SubcontractServiceEntity;
use App\Repository\SubcontractServiceEntityRepository;
use App\Request\DeleteRequest;
use App\Request\SubcontractServiceCreateRequest;
use App\Request\SubcontractServiceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class SubcontractServiceManager
{
    private $autoMapping;
    private $entityManager;
    private $subcontractServiceEntityRepository;
    private $subcontractManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, SubcontractServiceEntityRepository $subcontractServiceEntityRepository,
                                SubcontractManager $subcontractManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->subcontractServiceEntityRepository = $subcontractServiceEntityRepository;
        $this->subcontractManager = $subcontractManager;
    }

    public function create(SubcontractServiceCreateRequest $request)
    {
        $subcontractServiceEntity = $this->autoMapping->map(SubcontractServiceCreateRequest::class, SubcontractServiceEntity::class, $request);

        $this->entityManager->persist($subcontractServiceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $subcontractServiceEntity;
    }

    public function update(SubcontractServiceUpdateRequest $request)
    {
        $subcontractServiceEntity = $this->subcontractServiceEntityRepository->find($request->getId());
        
        if(!$subcontractServiceEntity)
        {
            return null;
        }
        else
        {
            $subcontractServiceEntity = $this->autoMapping->mapToObject(SubcontractServiceUpdateRequest::class, SubcontractServiceEntity::class, $request, $subcontractServiceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $subcontractServiceEntity;
        }
    }
    
    public function getSubcontractServiceById($serviceID)
    {
        return $this->subcontractServiceEntityRepository->getSubcontractServiceById($serviceID);
    }

    public function getAllSubcontractServices()
    {
        return $this->subcontractServiceEntityRepository->getAllSubcontractServices();
    }

    public function delete(DeleteRequest $request)
    {
        $subcontractServiceEntity = $this->subcontractServiceEntityRepository->find($request->getId());

        if(!$subcontractServiceEntity )
        {
            return "The service does not exist!";
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
                $this->entityManager->remove($subcontractServiceEntity);
                $this->entityManager->flush();
            }
        }

        return $subcontractServiceEntity;
    }

}