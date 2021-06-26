<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\AirwaybillSpecificationEntity;
use App\Repository\AirwaybillSpecificationEntityRepository;
use App\Request\AirwaybillSpecificationCreateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class AirwaybillSpecificationManager
{
    private $autoMapping;
    private $entityManager;
    private $airwaybillSpecificationEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillSpecificationEntityRepository $airwaybillSpecificationEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillSpecificationEntityRepository = $airwaybillSpecificationEntityRepository;
    }

    public function create(AirwaybillSpecificationCreateRequest $request)
    {
        $airwaybillSpecificationEntity = $this->autoMapping->map(AirwaybillSpecificationCreateRequest::class, AirwaybillSpecificationEntity::class, $request);

        $this->entityManager->persist($airwaybillSpecificationEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $airwaybillSpecificationEntity;
    }

    public function getAllAirwaybillSpecifications()
    {
        return $this->airwaybillSpecificationEntityRepository->getAllAirwaybillSpecifications();
    }

    public function deleteAirwaybillSpecificationById(DeleteRequest $request)
    {
        $item = $this->airwaybillSpecificationEntityRepository->find($request->getId());

        if(!$item)
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