<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ContainerStatusConstant;
use App\Constant\HolderShippingStatus;
use App\Constant\ShippingTypeConstant;
use App\Entity\ContainerEntity;
use App\Repository\ContainerEntityRepository;
use App\Request\ContainerCreateRequest;
use App\Request\ContainerShippingStatusUpdateRequest;
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
        //First, check if container number is entered and match the rule
        if(($request->getContainerNumber() == null) || ($request->getContainerNumber() != null && $this->validateContainerNumber($request->getContainerNumber())))
        {
            $containerEntity = $this->autoMapping->map(ContainerCreateRequest::class, ContainerEntity::class, $request);

            $containerEntity->setStatus(ContainerStatusConstant::$NOTFULL_CONTAINER_STATUS);
            $containerEntity->setShippingStatus(HolderShippingStatus::$NOT_UPLOADED_HOLDER_SHIPPING_STATUS);

            $this->entityManager->persist($containerEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerEntity;
        }
        else
        {
            //wrong container number
            return "wrong container number!";
        }
    }

    public function createFCLContainer(ContainerCreateRequest $request)
    {
        $containerEntity = $this->autoMapping->map(ContainerCreateRequest::class, ContainerEntity::class, $request);

        $containerEntity->setStatus(ContainerStatusConstant::$NOTFULL_CONTAINER_STATUS);
        $containerEntity->setType(ShippingTypeConstant::$FCL_SHIPPING_TYPE);
        $containerEntity->setShippingStatus(HolderShippingStatus::$NOT_UPLOADED_HOLDER_SHIPPING_STATUS);

        $this->entityManager->persist($containerEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerEntity;
    }

    public function update(ContainerUpdateRequest $request)
    {
        //First, check if container number is entered and match the rule
        if(($request->getContainerNumber() == null) || ($request->getContainerNumber() != null && $this->validateContainerNumber($request->getContainerNumber())))
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
        else
        {
            //wrong container number
            return "wrong container number!";
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

    public function updateShippingStatus(ContainerShippingStatusUpdateRequest $request)
    {
        $containerEntity = $this->containerEntityRepository->find($request->getId());

        if(!$containerEntity)
        {
            return $containerEntity;
        }
        else
        {
            $containerEntity = $this->autoMapping->mapToObject(ContainerShippingStatusUpdateRequest::class, ContainerEntity::class, $request, $containerEntity);

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

    public function getContainerByShipperID($shipperID)
    {
        return $this->containerEntityRepository->getContainerByShipperID($shipperID);
    }

    public function filterContainers($request)
    {
        return $this->containerEntityRepository->filterContainers($request);
    }

    public function getContainersBySpecificationID($specificationID)
    {
        return $this->containerEntityRepository->getContainersBySpecificationID($specificationID);
    }

    public function getSpecificationIdByContainerID($containerID)
    {
        return $this->containerEntityRepository->getSpecificationIdByContainerID($containerID);
    }

    public function validateContainerNumber($containerNumber)
    {
        /**
         * This function checks if the container number match the rule which says:
         * The number must starts with three characters either lower or upper case,
         * followed by a specific character of the group: UJZujz,
         * then followed by six digits from 0 to 9,
         * and finally by a one digit which called the Check Digit
         */
        $pattern = "/([a-zA-Z]{3})([UJZujz])(\d{6})(\d)/";

        if(is_string($containerNumber) && strlen($containerNumber) == 11 && preg_match($pattern, $containerNumber) == 1)
        {
            return true;
        }

        return false;
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