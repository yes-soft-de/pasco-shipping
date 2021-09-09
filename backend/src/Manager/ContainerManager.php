<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerStatusConstant;
use App\Constant\ShippingTypeConstant;
use App\Entity\ContainerEntity;
use App\Repository\ContainerEntityRepository;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerFilterRequest;
use App\Request\ContainerStatusUpdateRequest;
use App\Request\ContainerUpdateRequest;
use App\Request\DeleteRequest;
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

    public function createFCLContainer(ContainerCreateRequest $request)
    {
        $containerEntity = $this->autoMapping->map(ContainerCreateRequest::class, ContainerEntity::class, $request);

        $containerEntity->setStatus(ContainerStatusConstant::$FULL_CONTAINER_STATUS);
        $containerEntity->setType(ShippingTypeConstant::$FCL_SHIPPING_TYPE);

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

    public function getContainerByNumber($containerNumber)
    {
        return $this->containerEntityRepository->getContainerByNumber($containerNumber);
    }

    public function filterContainers(ContainerFilterRequest $request)
    {
        return $this->containerEntityRepository->filterContainers($request->getSpecificationID(), $request->getContainerNumber(), $request->getStatus(), $request->getType(),
        $request->getProvidedBy(), $request->getShipperID(), $request->getConsigneeID(), $request->getIsExternalWarehouse(), $request->getShipmentID(), $request->getClientUserID());
    }

    public function getContainersBySpecificationID($specificationID)
    {
        return $this->containerEntityRepository->getContainersBySpecificationID($specificationID);
    }

    public function deleteContainerById(DeleteRequest $request, $isUsed)
    {
        $item = $this->containerEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            //Check if the container isn't being used yet
            if(!$isUsed)
            {
                //its safe to delete the container
                $this->entityManager->remove($item);
                $this->entityManager->flush();
            }
            else
            {
                return "The container is being used. We can not delete it!";
            }
        }

        return $item;
    }

    public function deleteAllContainers()
    {
        return $this->containerEntityRepository->deleteAllContainers();
    }

}