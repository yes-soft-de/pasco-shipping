<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\CountryEntity;
use App\Repository\CountryEntityRepository;
use App\Request\CountryCreateRequest;
use App\Request\CountryUpdateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class CountryManager
{
    private $autoMapping;
    private $entityManager;
    private $countryEntityRepository;
    private $warehouseManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, CountryEntityRepository $countryEntityRepository,
     WarehouseManager $warehouseManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->countryEntityRepository = $countryEntityRepository;
        $this->warehouseManager = $warehouseManager;
    }

    public function create(CountryCreateRequest $request)
    {
        $countryEntity = $this->autoMapping->map(CountryCreateRequest::class, CountryEntity::class, $request);

        $this->entityManager->persist($countryEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $countryEntity;
    }

    public function update(CountryUpdateRequest $request)
    {
        $countryEntity = $this->countryEntityRepository->find($request->getId());

        if(!$countryEntity)
        {
            return  $countryEntity;
        }
        else
        {
            $countryEntity = $this->autoMapping->mapToObject(CountryUpdateRequest::class, CountryEntity::class,
                $request, $countryEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $countryEntity;
        }
    }

    public function getAllCountries()
    {
        return $this->countryEntityRepository->getAllCountries();
    }

    public function getWarehousesByCountryID($countryID)
    {
        return $this->warehouseManager->getWarehousesByCountryID($countryID);
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
            // Before deleting the country, check if it is used in a warehouse
            $warehouses = $this->getWarehousesByCountryID($request->getId());

            if($warehouses)
            {
                return "Can't delete the country because it is used!";
            }
            else
            {
                $this->entityManager->remove($item);
                $this->entityManager->flush();

                return $item;
            }
        }
    }

}