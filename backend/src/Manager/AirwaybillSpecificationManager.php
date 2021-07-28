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
    private $airwaybillManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, AirwaybillSpecificationEntityRepository $airwaybillSpecificationEntityRepository,
     AirwaybillManager $airwaybillManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->airwaybillSpecificationEntityRepository = $airwaybillSpecificationEntityRepository;
        $this->airwaybillManager = $airwaybillManager;
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
        $airwaybillSpecificationEntity = $this->airwaybillSpecificationEntityRepository->find($request->getId());

        if(!$airwaybillSpecificationEntity)
        {
            return $airwaybillSpecificationEntity;
        }
        else
        {
            //First, check if airwaybill specification is used
            $airwaybills = $this->airwaybillManager->getAirwaybillsBySpecificationID($request->getId());

            if($airwaybills)
            {
                return "Can not delete the specification because it's used before!";
            }
            else
            {
                $this->entityManager->remove($airwaybillSpecificationEntity);
                $this->entityManager->flush();

                return $airwaybillSpecificationEntity;
            }
        }
    }

}