<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillStatusConstant;
use App\Entity\AirwaybillEntity;
use App\Repository\AirwaybillEntityRepository;
use App\Request\AirwaybillCreateRequest;
use App\Request\AirwaybillFilterRequest;
use App\Request\AirwaybillUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillManager
{
    private $autoMapping;
    private $entityManager;
    private $airwaybillEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillEntityRepository $airwaybillEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillEntityRepository = $airwaybillEntityRepository;
    }

    public function create(AirwaybillCreateRequest $request)
    {
        $airwaybillEntity = $this->autoMapping->map(AirwaybillCreateRequest::class, AirwaybillEntity::class, $request);

        $airwaybillEntity->setStatus(AirwaybillStatusConstant::$NOTFULL_AIRWAYBILL_STATUS);

        $this->entityManager->persist($airwaybillEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $airwaybillEntity;
    }

    public function update(AirwaybillUpdateRequest $request)
    {
        $airwaybillEntity = $this->airwaybillEntityRepository->find($request->getId());

        if(!$airwaybillEntity)
        {
            return  $airwaybillEntity;
        }
        else
        {
            $airwaybillEntity = $this->autoMapping->mapToObject(AirwaybillUpdateRequest::class, AirwaybillEntity::class,
                $request, $airwaybillEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $airwaybillEntity;
        }
    }

    public function getAirwaybillsByStatus($status)
    {
        return $this->airwaybillEntityRepository->getAirwaybillsByStatus($status);
    }

    public function getAirwaybillById($id)
    {
        return $this->airwaybillEntityRepository->getAirwaybillById($id);
    }

    public function filterAirwaybills(AirwaybillFilterRequest $request)
    {
        if($request->getType() != null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsByType($request->getType());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() != null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillByNumber($request->getAirwaybillNumber());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() != null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsByConsigneeID($request->getConsigneeID());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() != null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsByProvidedBy($request->getProvidedBy());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() != null && 
        $request->getStatus() == null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsByShipperID($request->getShipperID());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() != null && $request->getSpecificationID() == null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsByStatus($request->getStatus());
        }
        elseif($request->getType() == null && $request->getAirwaybillNumber() == null && $request->getConsigneeID() == null && $request->getProvidedBy() == null && $request->getShipperID() == null && 
        $request->getStatus() == null && $request->getSpecificationID() != null)
        {
            return $this->airwaybillEntityRepository->getAirwaybillsBySpecificationID($request->getSpecificationID());
        }
    }

}