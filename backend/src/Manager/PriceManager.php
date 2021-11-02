<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShippingWayConstant;
use App\Entity\PriceEntity;
use App\Repository\PriceEntityRepository;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use App\Request\DeleteRequest;
use App\Request\PriceCreateRequest;
use App\Request\PricesFilterRequest;
use App\Request\PriceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class PriceManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $warehouseManager;
    private $priceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, PriceEntityRepository $priceEntityRepository,
     ShipmentOrderManager $shipmentOrderManager, WarehouseManager $warehouseManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->warehouseManager = $warehouseManager;
        $this->priceEntityRepository = $priceEntityRepository;
    }

    public function create(PriceCreateRequest $request)
    {
        $priceEntity = $this->autoMapping->map(PriceCreateRequest::class, PriceEntity::class, $request);

        $this->entityManager->persist($priceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $priceEntity;
    }

    public function update(PriceUpdateRequest $request)
    {
        $priceEntity = $this->priceEntityRepository->find($request->getId());

        if(!$priceEntity)
        {

        }
        else
        {
            $priceEntity = $this->autoMapping->mapToObject(PriceUpdateRequest::class, PriceEntity::class, $request, $priceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $priceEntity;
        }
    }

    public function getPrices()
    {
        $result = [];

        $result['prices'] = $this->priceEntityRepository->getAllPrices();

        $result['containerSpecifications'] = [];

        return $result;
    }

    public function getOneKiloPriceByShipmentID($shipmentID)
    {
        $filterRequest = new PricesFilterRequest();

        $exportWarehouseID = $this->shipmentOrderManager->getExportWarehouseIdByShipmentOrderID($shipmentID);
        $importWarehouseID = $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($shipmentID);

        if($exportWarehouseID)
        {
            $exportCountryIdAndCity = $this->warehouseManager->getCountryIdAndCityOfWarehouseByWarehouseID($exportWarehouseID);

            $filterRequest->setExportCountryID($exportCountryIdAndCity['countryID']);
            $filterRequest->setExportCity($exportCountryIdAndCity['city']);
        }

        if($importWarehouseID)
        {
            $importCountryIdAndCity = $this->warehouseManager->getCountryIdAndCityOfWarehouseByWarehouseID($importWarehouseID);

            $filterRequest->setImportCountryID($importCountryIdAndCity['countryID']);
            $filterRequest->setImportCity($importCountryIdAndCity['city']);
        }

        $result = $this->priceEntityRepository->filterPrices($filterRequest);

        if($result)
        {
            return $result[0]['oneKiloPrice'];
        }

        return 0;
    }

    public function getOneCBMPriceByShipmentID($shipmentID)
    {
        $filterRequest = new PricesFilterRequest();

        $exportWarehouseID = $this->shipmentOrderManager->getExportWarehouseIdByShipmentOrderID($shipmentID);
        $importWarehouseID = $this->shipmentOrderManager->getImportWarehouseIdByShipmentOrderID($shipmentID);

        if($exportWarehouseID)
        {
            $exportCountryIdAndCity = $this->warehouseManager->getCountryIdAndCityOfWarehouseByWarehouseID($exportWarehouseID);

            $filterRequest->setExportCountryID($exportCountryIdAndCity['countryID']);
            $filterRequest->setExportCity($exportCountryIdAndCity['city']);
        }

        if($importWarehouseID)
        {
            $importCountryIdAndCity = $this->warehouseManager->getCountryIdAndCityOfWarehouseByWarehouseID($importWarehouseID);

            $filterRequest->setImportCountryID($importCountryIdAndCity['countryID']);
            $filterRequest->setImportCity($importCountryIdAndCity['city']);
        }

        $result = $this->priceEntityRepository->filterPrices($filterRequest);

        if($result)
        {
            return $result[0]['oneCBMPrice'];
        }

        return 0;
    }

    public function filterPrices($request)
    {
        return $this->priceEntityRepository->filterPrices($request);
    }

    public function delete(DeleteRequest $request)
    {
        $item = $this->priceEntityRepository->find($request->getId());

        if(!$item)
        {
            return "No prices record was found!";
        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();

            return $item;
        }
    }

}