<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\DistributorEntity;
use App\Repository\DistributorEntityRepository;
use App\Request\DeleteRequest;
use App\Request\DistributorCreateRequest;
use App\Request\DistributorUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class DistributorManager
{
    private $autoMapping;
    private $entityManager;
    private $distributorEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, DistributorEntityRepository $distributorEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->distributorEntityRepository = $distributorEntityRepository;
    }

    public function create(DistributorCreateRequest $request)
    {
        $distributorEntity = $this->autoMapping->map(DistributorCreateRequest::class, DistributorEntity::class, $request);

        $this->entityManager->persist($distributorEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $distributorEntity;
    }

    public function update(DistributorUpdateRequest $request)
    {
        $distributorEntity = $this->distributorEntityRepository->find($request->getId());

        if(!$distributorEntity)
        {
            return  $distributorEntity;
        }
        else
        {
            $distributorEntity = $this->autoMapping->mapToObject(DistributorUpdateRequest::class, DistributorEntity::class,
                $request, $distributorEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $distributorEntity;
        }
    }

    public function getAllDistributors()
    {
        return $this->distributorEntityRepository->getAllDistributors();
    }

    public function deleteDistributorById(DeleteRequest $request)
    {
        $item = $this->distributorEntityRepository->find($request->getId());

        if(!$item)
        {

        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }

}