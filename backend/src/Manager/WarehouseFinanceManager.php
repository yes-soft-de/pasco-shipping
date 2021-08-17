<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\WarehouseFinanceEntity;
use App\Repository\WarehouseFinanceEntityRepository;
use App\Request\WarehouseFinanceCreateRequest;
use App\Request\WarehouseFinanceFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class WarehouseFinanceManager
{
    private $autoMapping;
    private $entityManager;
    private $warehouseFinanceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, WarehouseFinanceEntityRepository $warehouseFinanceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->warehouseFinanceEntityRepository = $warehouseFinanceEntityRepository;
    }

    public function create(WarehouseFinanceCreateRequest $request)
    {
        $warehouseFinanceEntity = $this->autoMapping->map(WarehouseFinanceCreateRequest::class, WarehouseFinanceEntity::class, $request);
        
        $this->entityManager->persist($warehouseFinanceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $warehouseFinanceEntity;
    }

    public function filterWarehouseFinances(WarehouseFinanceFilterRequest $request)
    {
        return $this->warehouseFinanceEntityRepository->filterWarehouseFinances($request->getWarehouseID());
    }

}