<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\CountryEntity;
use App\Repository\CountryEntityRepository;
use App\Request\CountryCreateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class CountryManager
{
    private $autoMapping;
    private $entityManager;
    private $countryEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, CountryEntityRepository $countryEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->countryEntityRepository = $countryEntityRepository;
    }

    public function create(CountryCreateRequest $request)
    {
        $countryEntity = $this->autoMapping->map(CountryCreateRequest::class, CountryEntity::class, $request);

        $this->entityManager->persist($countryEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $countryEntity;
    }

    public function getAllCountries()
    {
        return $this->countryEntityRepository->getAllCountries();
    }

    public function deleteCountryById(DeleteRequest $request)
    {
        $item = $this->countryEntityRepository->find($request->getId());

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