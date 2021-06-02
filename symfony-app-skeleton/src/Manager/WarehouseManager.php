<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\WarehouseEntity;
use App\Repository\WarehouseEntityRepository;
use App\Request\WarehouseCreateRequest;
use App\Request\WarehouseUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class WarehouseManager
{
    private $autoMapping;
    private $entityManager;
    private $warehouseEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, WarehouseEntityRepository $warehouseEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->warehouseEntityRepository = $warehouseEntityRepository;
    }

    public function create(WarehouseCreateRequest $request)
    {
        $warehouseEntity = $this->autoMapping->map(WarehouseCreateRequest::class, WarehouseEntity::class, $request);
        
        $this->entityManager->persist($warehouseEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $warehouseEntity;
    }

    public function update(WarehouseUpdateRequest $request)
    {
        $warehouseEntity = $this->warehouseEntityRepository->find($request->getId());

        if(!$warehouseEntity)
        {

        }
        else
        {
            $warehouseEntity = $this->autoMapping->mapToObject(WarehouseUpdateRequest::class, WarehouseEntity::class, $request, $warehouseEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $warehouseEntity;
        }
    }


}