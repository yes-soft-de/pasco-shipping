<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ContainerSpecificationEntity;
use App\Repository\ContainerSpecificationEntityRepository;
use App\Request\ContainerSpecificationCreateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerSpecificationManager
{
    private $autoMapping;
    private $entityManager;
    private $containerSpecificationEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerSpecificationEntityRepository $containerSpecificationEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerSpecificationEntityRepository = $containerSpecificationEntityRepository;
    }

    public function create(ContainerSpecificationCreateRequest $request)
    {
        $containerEntity = $this->autoMapping->map(ContainerSpecificationCreateRequest::class, ContainerSpecificationEntity::class, $request);

        $this->entityManager->persist($containerEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerEntity;
    }

    public function getAllContainerSpecifications()
    {
        return $this->containerSpecificationEntityRepository->getAllContainerSpecifications();
    }

    public function deleteContainerSpecificationById(DeleteRequest $request)
    {
        $item = $this->containerSpecificationEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }

}