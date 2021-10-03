<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ContainerSpecificationEntity;
use App\Repository\ContainerSpecificationEntityRepository;
use App\Request\ContainerSpecificationCreateRequest;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use App\Request\ContainerSpecificationUpdateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerSpecificationManager
{
    private $autoMapping;
    private $entityManager;
    private $containerSpecificationEntityRepository;
    private $containerManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerSpecificationEntityRepository $containerSpecificationEntityRepository,
     ContainerManager $containerManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerSpecificationEntityRepository = $containerSpecificationEntityRepository;
        $this->containerManager = $containerManager;
    }

    public function create(ContainerSpecificationCreateRequest $request)
    {
        $containerEntity = $this->autoMapping->map(ContainerSpecificationCreateRequest::class, ContainerSpecificationEntity::class, $request);

        $this->entityManager->persist($containerEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerEntity;
    }

    public function update(ContainerSpecificationUpdateRequest $request)
    {
        $specificationEntity = $this->containerSpecificationEntityRepository->find($request->getId());

        if(!$specificationEntity)
        {

        }
        else
        {
            $specificationEntity = $this->autoMapping->mapToObject(ContainerSpecificationUpdateRequest::class, ContainerSpecificationEntity::class,
                $request, $specificationEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $specificationEntity;
        }
    }

    public function updatePrice(ContainerSpecificationPriceUpdateRequest $request)
    {
        $specificationEntity = $this->containerSpecificationEntityRepository->find($request->getId());

        if(!$specificationEntity)
        {

        }
        else
        {
            $specificationEntity = $this->autoMapping->mapToObject(ContainerSpecificationPriceUpdateRequest::class, ContainerSpecificationEntity::class,
             $request, $specificationEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $specificationEntity;
        }
    }

    public function getAllContainerSpecifications()
    {
        return $this->containerSpecificationEntityRepository->getAllContainerSpecifications();
    }

    public function deleteContainerSpecificationById(DeleteRequest $request)
    {
        $containerSpecificationEntity = $this->containerSpecificationEntityRepository->find($request->getId());

        if(!$containerSpecificationEntity)
        {
            return $containerSpecificationEntity;
        }
        else
        {
            //First, check if the specifications are used
            $containers = $this->containerManager->getContainersBySpecificationID($request->getId());

            if($containers)
            {
                return "Can not delete the specifications because they are used before!";
            }
            else
            {
                $this->entityManager->remove($containerSpecificationEntity);
                $this->entityManager->flush();
            }

            return $containerSpecificationEntity;
        }
    }

    public function getContainerSpecificationById($specificationID)
    {
        return $this->containerSpecificationEntityRepository->getContainerSpecificationById($specificationID);
    }

}