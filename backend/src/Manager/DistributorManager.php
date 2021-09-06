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
    private $shipmentOrderManager;
    private $distributorEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, DistributorEntityRepository $distributorEntityRepository,
    ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
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

    public function getShipmentOrderByDistributor($distributorID)
    {
        return $this->shipmentOrderManager->getShipmentOrderByDistributor($distributorID);
    }

    public function deleteDistributorById(DeleteRequest $request)
    {
        $distributorEntity = $this->distributorEntityRepository->find($request->getId());

        if(!$distributorEntity)
        {

        }
        else
        {
            // Check if distributor is not being used yet
            $result = $this->getShipmentOrderByDistributor($request->getId());

            if(!$result)
            {
                //its safe to delete the distributor
                $this->entityManager->remove($distributorEntity);
                $this->entityManager->flush();
            }
            else
            {
                return "The distributor is being used. We can not delete it!";
            }
        }

        return $distributorEntity;
    }

}