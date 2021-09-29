<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\PriceEntity;
use App\Repository\PriceEntityRepository;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use App\Request\PriceCreateRequest;
use App\Request\PriceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class PriceManager
{
    private $autoMapping;
    private $entityManager;
    private $containerSpecificationManager;
    private $priceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, PriceEntityRepository $priceEntityRepository,
     ContainerSpecificationManager $containerSpecificationManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerSpecificationManager = $containerSpecificationManager;
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
            $priceCreateRequest = $this->autoMapping->map(PriceUpdateRequest::class, PriceCreateRequest::class, $request);

            return $this->create($priceCreateRequest);
        }
        else
        {
            $priceEntity = $this->autoMapping->mapToObject(PriceUpdateRequest::class, PriceEntity::class, $request, $priceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            //Now update the price of specific container specification
            $this->updateContainerSpecificationsPrices($request->getContainerSpecifications(), $request->getUpdatedBy());

            return $priceEntity;
        }
    }

    public function updateContainerSpecificationsPrices($containerSpecificationsPricesArray, $updatedBy)
    {
        $updateSpecificationPriceRequest = new ContainerSpecificationPriceUpdateRequest();

        foreach($containerSpecificationsPricesArray as $item)
        {
            $updateSpecificationPriceRequest->setId($item['id']);
            $updateSpecificationPriceRequest->setPrice($item['price']);
            $updateSpecificationPriceRequest->setUpdatedBy($updatedBy);

            $this->containerSpecificationManager->updatePrice($updateSpecificationPriceRequest);
        }
    }

    public function getPrices()
    {
        $prices = $this->priceEntityRepository->getPrices();

        $prices['containerSpecifications'] = $this->containerSpecificationManager->getAllContainerSpecifications();

        return $prices;
    }

}