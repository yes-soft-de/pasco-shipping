<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\WarehouseEntity;
use App\Repository\WarehouseEntityRepository;
use App\Request\DeleteRequest;
use App\Request\WarehouseCreateRequest;
use App\Request\WarehouseFilterRequest;
use App\Request\WarehouseUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class WarehouseManager
{
    private $autoMapping;
    private $entityManager;
    private $warehouseEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, WarehouseEntityRepository $warehouseEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->warehouseEntityRepository = $warehouseEntityRepository;
    }

    public function create(WarehouseCreateRequest $request)
    {
        $warehouseEntity = $this->autoMapping->map(WarehouseCreateRequest::class, WarehouseEntity::class, $request);

        //Before entering the new warehouse we have to detect if the city name being entered matches the existing name
        if($this->checkIfCityNameIsExistAndMatched($request->getCountryID(), $request->getCity()))
        {
            $this->entityManager->persist($warehouseEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $warehouseEntity;
        }
        else
        {
            return "The name of the entered city is written either in small or capital letter";
        }
    }

    public function checkIfCityNameIsExistAndMatched($countryID, $cityName)
    {
        //First get the warehouse of the city
        $warehouse = $this->warehouseEntityRepository->getWarehousesByCountryIdAndCity($countryID, $cityName);

        //Second, compare the name of the city of existing warehouse with the entered city name
        if($warehouse)
        {
            $warehouseCityName = $warehouse[0]['city'];

            if(strcmp($warehouseCityName, $cityName) == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        // No warehouse existing with the provided city name, it safe to enter it
        return true;
    }

    public function update(WarehouseUpdateRequest $request)
    {
        $warehouseEntity = $this->warehouseEntityRepository->find($request->getId());

        if(!$warehouseEntity)
        {
            return $warehouseEntity;
        }
        else
        {
            $warehouseEntity = $this->autoMapping->mapToObject(WarehouseUpdateRequest::class, WarehouseEntity::class, $request, $warehouseEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $warehouseEntity;
        }
    }

    public function getAllWarehouses()
    {
        return $this->warehouseEntityRepository->getAllWarehouses();
    }

    public function filterWarehouses(WarehouseFilterRequest $request)
    {
        /**
         * If we want to get all warehouses in the country that the city (target) exist in
         * we have first to get all the countries IDs that the same city could be exist
         * and finally get all the warehouses of each country
         */
        if($request->getTarget())
        {
            $warehouses = $this->warehouseEntityRepository->getWarehousesByCity($request->getTarget());

            if($warehouses)
            {
                $countriesIDs = [];

                foreach($warehouses as $warehouse)
                {
                    $countriesIDs[] = $warehouse['countryID'];
                }

                $request->setCountriesIDs($countriesIDs);
            }
        }

        return $this->warehouseEntityRepository->filterWarehouses($request);
    }

    public function getWarehousesByCountryID($countryID)
    {
        return $this->warehouseEntityRepository->getWarehousesByCountryID($countryID);
    }

    public function getByProxyID($proxyID)
    {
        return $this->warehouseEntityRepository->getByProxyID($proxyID);
    }

    public function deleteWarehouseById(DeleteRequest $request)
    {
        $item = $this->warehouseEntityRepository->find($request->getId());

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