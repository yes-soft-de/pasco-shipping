<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\SubcontractEntity;
use App\Repository\SubcontractEntityRepository;
use App\Request\SubcontractCreateRequest;
use App\Request\SubcontractUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class SubcontractManager
{
    private $autoMapping;
    private $entityManager;
    private $subcontractEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, SubcontractEntityRepository $subcontractEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->subcontractEntityRepository = $subcontractEntityRepository;
    }

    public function create(SubcontractCreateRequest $request)
    {
        $subcontractEntity = $this->autoMapping->map(SubcontractCreateRequest::class, SubcontractEntity::class, $request);
        
        $this->entityManager->persist($subcontractEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $subcontractEntity;
    }

    public function update(SubcontractUpdateRequest $request)
    {
        $subcontractEntity = $this->subcontractEntityRepository->find($request->getId());

        if(!$subcontractEntity)
        {
            return $subcontractEntity;
        }
        else
        {
            $subcontractEntity = $this->autoMapping->mapToObject(SubcontractUpdateRequest::class, SubcontractEntity::class, $request, $subcontractEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $subcontractEntity;
        }
    }

    public function getAllSubcontracts()
    {
        return $this->subcontractEntityRepository->getAllSubcontracts();
    }

    public function getSubcontractsByServiceID($serviceID)
    {
        return $this->subcontractEntityRepository->getSubcontractsByServiceID($serviceID);
    }

    public function filterSubcontracts($request)
    {
        return $this->subcontractEntityRepository->filterSubcontracts($request);
    }

    public function deleteAllSubcontracts()
    {
        return $this->subcontractEntityRepository->deleteAllSubcontracts();
    }

}