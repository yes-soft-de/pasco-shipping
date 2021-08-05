<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerStatusConstant;
use App\Entity\ContainerEntity;
use App\Repository\ContainerEntityRepository;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerFilterRequest;
use App\Request\ContainerStatusUpdateRequest;
use App\Request\ContainerUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerManager
{
    private $autoMapping;
    private $entityManager;
    private $containerEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerEntityRepository $containerEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerEntityRepository = $containerEntityRepository;
    }

    public function create(ContainerCreateRequest $request)
    {
        $containerEntity = $this->autoMapping->map(ContainerCreateRequest::class, ContainerEntity::class, $request);

        $containerEntity->setStatus(ContainerStatusConstant::$NOTFULL_CONTAINER_STATUS);

        $this->entityManager->persist($containerEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerEntity;
    }

    public function update(ContainerUpdateRequest $request)
    {
        $containerEntity = $this->containerEntityRepository->find($request->getId());

        if(!$containerEntity)
        {
            return $containerEntity;
        }
        else
        {
            $containerEntity = $this->autoMapping->mapToObject(ContainerUpdateRequest::class, ContainerEntity::class, $request, $containerEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerEntity;
        }
    }

    public function updateStatus(ContainerStatusUpdateRequest $request)
    {
        $containerEntity = $this->containerEntityRepository->find($request->getId());

        if(!$containerEntity)
        {
            return $containerEntity;
        }
        else
        {
            $containerEntity = $this->autoMapping->mapToObject(ContainerStatusUpdateRequest::class, ContainerEntity::class, $request, $containerEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerEntity;
        }
    }

    public function getByStatus($status)
    {
        return $this->containerEntityRepository->getByStatus($status);
    }

    public function getContainerById($id)
    {
        return $this->containerEntityRepository->getContainerById($id);
    }

    public function filterContainers(ContainerFilterRequest $request)
    {
        if($request->getType() != null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainersByType($request->getType());
        }
        elseif($request->getType() == null && $request->getContainerNumber() != null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainerByNumber($request->getContainerNumber());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() != null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainersByConsigneeID($request->getConsigneeID());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() != null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainersByProvidedBy($request->getProvidedBy());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() != null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainersByShipperID($request->getShipperID());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() != null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getByStatus($request->getStatus());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() != null)
        {
            return $this->containerEntityRepository->getContainersBySpecificationID($request->getSpecificationID());
        }
        elseif($request->getType() == null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getAllContainers();
        }
        elseif($request->getType() != null && $request->getContainerNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() != null && $request->getSpecificationID() == null)
        {
            return $this->containerEntityRepository->getContainersByStatusAndType($request->getStatus(), $request->getType());
        }
    }

    public function getContainersBySpecificationID($specificationID)
    {
        return $this->containerEntityRepository->getContainersBySpecificationID($specificationID);
    }

    public function deleteAllContainers()
    {
        return $this->containerEntityRepository->deleteAllContainers();
    }

}