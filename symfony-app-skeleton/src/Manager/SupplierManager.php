<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\SupplierEntity;
use App\Repository\SupplierEntityRepository;
use App\Request\DeleteRequest;
use App\Request\SupplierCreateRequest;
use App\Request\SupplierUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class SupplierManager
{
    private $autoMapping;
    private $entityManager;
    private $supplierEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, SupplierEntityRepository $supplierEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->supplierEntityRepository = $supplierEntityRepository;
    }

    public function create(SupplierCreateRequest $request)
    {
        $supplierEntity = $this->autoMapping->map(SupplierCreateRequest::class, SupplierEntity::class, $request);

        $this->entityManager->persist($supplierEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $supplierEntity;
    }

    public function update(SupplierUpdateRequest $request)
    {
        $supplierEntity = $this->supplierEntityRepository->find($request->getId());

        if (!$supplierEntity)
        {
            return $supplierEntity;
        }
        else
        {
            $supplierEntity = $this->autoMapping->mapToObject(SupplierUpdateRequest::class, SupplierEntity::class,
                $request, $supplierEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $supplierEntity;
        }
    }

    public function getAllSuppliers()
    {
        return $this->supplierEntityRepository->getAllSuppliers();
    }

    public function deleteSupplierById(DeleteRequest $request)
    {
        $item = $this->supplierEntityRepository->find($request->getId());

        if (!$item)
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