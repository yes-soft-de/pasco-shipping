<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ShipperEntity;
use App\Repository\ShipperEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ShipperCreateRequest;
use App\Request\ShipperUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShipperManager
{
    private $autoMapping;
    private $entityManager;
    private $containerManager;
    private $airwaybillManager;
    private $shipperEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShipperEntityRepository $shipperEntityRepository,
     AirwaybillManager $airwaybillManager, ContainerManager $containerManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerManager = $containerManager;
        $this->airwaybillManager = $airwaybillManager;
        $this->shipperEntityRepository = $shipperEntityRepository;
    }

    public function create(ShipperCreateRequest $request)
    {
        $shipperEntity = $this->autoMapping->map(ShipperCreateRequest::class, ShipperEntity::class, $request);

        $this->entityManager->persist($shipperEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shipperEntity;
    }

    public function update(ShipperUpdateRequest $request)
    {
        $shipperEntity = $this->shipperEntityRepository->find($request->getId());

        if(!$shipperEntity)
        {

        }
        else
        {
            $shipperEntity = $this->autoMapping->mapToObject(ShipperUpdateRequest::class, ShipperEntity::class, $request, $shipperEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shipperEntity;
        }
    }

    public function getAllShippers()
    {
        return $this->shipperEntityRepository->getAllShippers();
    }

    public function delete(DeleteRequest $request)
    {
        $shipperEntity = $this->shipperEntityRepository->find($request->getId());

        if(!$shipperEntity )
        {
            return "The shipper does not exist!";
        }
        else
        {
            // check if the shipper is not being used before
            $airWaybills = $this->airwaybillManager->getAirwaybillByShipperID($request->getId());
            $containers = $this->containerManager->getContainerByShipperID($request->getId());

            if(empty($airWaybills) && empty($containers))
            {
                $this->entityManager->remove($shipperEntity);
                $this->entityManager->flush();
            }
            else
            {
                return "Can't delete the shipper. It's used!";
            }
        }

        return $shipperEntity;
    }


}