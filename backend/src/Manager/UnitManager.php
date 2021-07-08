<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\UnitEntity;
use App\Repository\UnitEntityRepository;
use App\Request\DeleteRequest;
use App\Request\UnitCreateRequest;
use App\Request\UnitUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class UnitManager
{
    private $autoMapping;
    private $entityManager;
    private $unitEntityRepository;
    private $shipmentOrderManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, UnitEntityRepository $unitEntityRepository,
     ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->unitEntityRepository = $unitEntityRepository;
        $this->shipmentOrderManager = $shipmentOrderManager;
    }

    public function create(UnitCreateRequest $request)
    {
        $unitEntity = $this->autoMapping->map(UnitCreateRequest::class, UnitEntity::class, $request);

        $this->entityManager->persist($unitEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $unitEntity;
    }

    public function update(UnitUpdateRequest $request)
    {
        $unitEntity = $this->unitEntityRepository->find($request->getId());

        if(!$unitEntity)
        {
            return  $unitEntity;
        }
        else
        {
            $unitEntity = $this->autoMapping->mapToObject(UnitUpdateRequest::class, UnitEntity::class, $request, $unitEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $unitEntity;
        }
    }

    public function getAllUnits()
    {
        return $this->unitEntityRepository->getAllUnits();
    }

    public function deleteUnitById(DeleteRequest $request)
    {
        $item = $this->unitEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            // Before deleting the unit, check if it is used in a shipment order
            $shipmentOrder = $this->shipmentOrderManager->getShipmentOrderByUnitName($item->getName());
            
            if($shipmentOrder)
            {
                return "Can't delete the unit because it is used!";
            }
            else
            {
                $this->entityManager->remove($item);
                $this->entityManager->flush();
            }

            return $item;
        }
    }

}