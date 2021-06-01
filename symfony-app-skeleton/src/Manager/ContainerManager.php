<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ContainerEntity;
use App\Repository\ContainerEntityRepository;
use App\Request\ContainerCreateRequest;
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
        
        $this->entityManager->persist($containerEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerEntity;
    }

    public function getByStatus($status)
    {
        return $this->containerEntityRepository->getByStatus($status);
    }

}