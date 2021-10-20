<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\AirwaybillStatusConstant;
use App\Constant\HolderShippingStatus;
use App\Constant\ShippingTypeConstant;
use App\Entity\AirwaybillEntity;
use App\Repository\AirwaybillEntityRepository;
use App\Request\AirwaybillCreateRequest;
use App\Request\AirwaybillShippingStatusUpdateRequest;
use App\Request\AirwaybillStatusUpdateRequest;
use App\Request\AirwaybillUpdateRequest;
use App\Request\DeleteRequest;
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
        $airwaybillEntity->setShippingStatus(HolderShippingStatus::$NOT_UPLOADED_HOLDER_SHIPPING_STATUS);

        $this->entityManager->persist($airwaybillEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $airwaybillEntity;
    }

    public function createFCLAirWaybill(AirwaybillCreateRequest $request)
    {
        $airwaybillEntity = $this->autoMapping->map(AirwaybillCreateRequest::class, AirwaybillEntity::class, $request);

        $airwaybillEntity->setStatus(AirwaybillStatusConstant::$NOTFULL_AIRWAYBILL_STATUS);
        $airwaybillEntity->setType(ShippingTypeConstant::$FCL_SHIPPING_TYPE);
        $airwaybillEntity->setShippingStatus(HolderShippingStatus::$NOT_UPLOADED_HOLDER_SHIPPING_STATUS);

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
            return $airwaybillEntity;
        }
        else
        {
            $airwaybillEntity = $this->autoMapping->mapToObject(AirwaybillUpdateRequest::class, AirwaybillEntity::class, $request, $airwaybillEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $airwaybillEntity;
        }
    }

    public function updateStatus(AirwaybillStatusUpdateRequest $request)
    {
        $airwaybillEntity = $this->airwaybillEntityRepository->find($request->getId());

        if(!$airwaybillEntity)
        {
            return $airwaybillEntity;
        }
        else
        {
            $airwaybillEntity = $this->autoMapping->mapToObject(AirwaybillStatusUpdateRequest::class, AirwaybillEntity::class, $request, $airwaybillEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $airwaybillEntity;
        }
    }

    public function updateShippingStatus(AirwaybillShippingStatusUpdateRequest $request)
    {
        $airwaybillEntity = $this->airwaybillEntityRepository->find($request->getId());

        if(!$airwaybillEntity)
        {
            return $airwaybillEntity;
        }
        else
        {
            $airwaybillEntity = $this->autoMapping->mapToObject(AirwaybillShippingStatusUpdateRequest::class, AirwaybillEntity::class, $request, $airwaybillEntity);

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

    public function getAirWaybillByNumber($airWaybillNumber)
    {
        return $this->airwaybillEntityRepository->getAirwaybillByNumber($airWaybillNumber);
    }

    public function getAirwaybillByShipperID($shipperID)
    {
        return $this->airwaybillEntityRepository->getAirwaybillByShipperID($shipperID);
    }

    public function filterAirwaybills($request)
    {
        return $this->airwaybillEntityRepository->filterAirWaybills($request);
    }

    public function getAirwaybillsBySpecificationID($specificationID)
    {
        return $this->airwaybillEntityRepository->getAirwaybillsBySpecificationID($specificationID);
    }

    public function getProxyIdOfExportWarehouseByAirWaybillID($airWaybillID)
    {
        return $this->airwaybillEntityRepository->getProxyIdOfExportWarehouseByAirWaybillID($airWaybillID);
    }

    public function deleteAirWaybillById(DeleteRequest $request, $isUsed)
    {
        $item = $this->airwaybillEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            //Check if the air waybill isn't being used yet
            if(!$isUsed)
            {
                //its safe to delete the air waybill
                $this->entityManager->remove($item);
                $this->entityManager->flush();
            }
            else
            {
                return "The air waybill is being used. We can not delete it!";
            }
        }

        return $item;
    }

    public function deleteAllAirwaybills()
    {
        return $this->airwaybillEntityRepository->deleteAllAirwaybills();
    }

}