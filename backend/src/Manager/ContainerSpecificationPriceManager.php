<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ContainerSpecificationPriceEntity;
use App\Repository\ContainerSpecificationPriceEntityRepository;
use App\Request\ContainerSpecificationPriceCreateRequest;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ContainerSpecificationPriceManager
{
    private $autoMapping;
    private $entityManager;
    private $containerSpecificationPriceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ContainerSpecificationPriceEntityRepository $containerSpecificationPriceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->containerSpecificationPriceEntityRepository = $containerSpecificationPriceEntityRepository;
    }

    public function create(ContainerSpecificationPriceCreateRequest $request)
    {
        $containerSpecificationPriceEntity = $this->autoMapping->map(ContainerSpecificationPriceCreateRequest::class, ContainerSpecificationPriceEntity::class, $request);

        $this->entityManager->persist($containerSpecificationPriceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $containerSpecificationPriceEntity;
    }

    public function update(ContainerSpecificationPriceUpdateRequest $request)
    {
        $containerSpecificationPriceEntity = $this->containerSpecificationPriceEntityRepository->find($request->getId());

        if(!$containerSpecificationPriceEntity)
        {

        }
        else
        {
            $containerSpecificationPriceEntity = $this->autoMapping->mapToObject(ContainerSpecificationPriceUpdateRequest::class, ContainerSpecificationPriceEntity::class,
                $request, $containerSpecificationPriceEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $containerSpecificationPriceEntity;
        }
    }

    public function getAllContainerSpecificationPrices()
    {
        return $this->containerSpecificationPriceEntityRepository->getAllContainerSpecificationPrices();
    }

    public function getContainerSpecificationPriceBySpecificationIdAndExportCountryIdAndExportCityAndDestinationPortID($specificationID, $exportCountryID, $exportCity, $destinationPortID)
    {
        return $this->containerSpecificationPriceEntityRepository->getContainerSpecificationPriceBySpecificationIdAndExportCountryIdAndExportCityAndDestinationPortID($specificationID,
            $exportCountryID, $exportCity, $destinationPortID);
    }

}