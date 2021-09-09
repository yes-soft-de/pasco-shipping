<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\GunnyStatusConstant;
use App\Entity\GunnyEntity;
use App\Repository\GunnyEntityRepository;
use App\Request\DeleteRequest;
use App\Request\GunnyCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class GunnyManager
{
    private $autoMapping;
    private $entityManager;
    private $gunnyEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, GunnyEntityRepository $gunnyEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->gunnyEntityRepository = $gunnyEntityRepository;
    }

    public function create(GunnyCreateRequest $request)
    {
        $gunnyEntity = $this->autoMapping->map(GunnyCreateRequest::class, GunnyEntity::class, $request);

        $gunnyEntity->setIdentificationNumber($this->generateIdentificationNumber());
        $gunnyEntity->setStatus(GunnyStatusConstant::$NOT_FULL_GUNNY_STATUS);

        $this->entityManager->persist($gunnyEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $this->getGunnyByStatus(GunnyStatusConstant::$NOT_FULL_GUNNY_STATUS);
    }

    public function getGunnyByStatus($status)
    {
        return $this->gunnyEntityRepository->getGunnyByStatus($status);
    }

    public function getGunnyByIdentificationNumber($identificationNumber)
    {
        return $this->gunnyEntityRepository->getGunnyByIdentificationNumber($identificationNumber);
    }

    public function deleteGunnyById(DeleteRequest $request)
    {
        $gunnyEntity = $this->gunnyEntityRepository->find($request->getId());

        if(!$gunnyEntity)
        {

        }
        else
        {
            $this->entityManager->remove($gunnyEntity);
            $this->entityManager->flush();
        }

        return $gunnyEntity;
    }

    public function generateIdentificationNumber()
    {
        do
        {
            // keep generating identification number while it is exist
            $found = false;
            $identificationNumber = "";
            $result = "";

            for ($i = 0; $i < 7; $i++)
            {
                $identificationNumber .= random_int(0, 9);
            }

            // Check if it is exist
            $result = $this->getGunnyByIdentificationNumber($identificationNumber);

            if($result)
            {
                $found = true;
            }

        }
        while($found);

        return $identificationNumber;
    }

}