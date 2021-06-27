<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillStatusConstant;
use App\Entity\AirwaybillEntity;
use App\Repository\AirwaybillEntityRepository;
use App\Request\AirwaybillCreateRequest;
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

}