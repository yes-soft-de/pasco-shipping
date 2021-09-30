<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShiftingShipmentOrderStatusConstant;
use App\Entity\ShiftingShipmentOrderEntity;
use App\Repository\ShiftingShipmentOrderEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ShiftingShipmentOrderCreateRequest;
use App\Request\ShiftingShipmentOrderStatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ShiftingShipmentOrderManager
{
    private $autoMapping;
    private $entityManager;
    private $shiftingShipmentOrderEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ShiftingShipmentOrderEntityRepository $shiftingShipmentOrderEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shiftingShipmentOrderEntityRepository = $shiftingShipmentOrderEntityRepository;
    }

    public function create(ShiftingShipmentOrderCreateRequest $request)
    {
        $shiftingShipmentOrderEntity = $this->autoMapping->map(ShiftingShipmentOrderCreateRequest::class, ShiftingShipmentOrderEntity::class, $request);

        $shiftingShipmentOrderEntity->setStatus(ShiftingShipmentOrderStatusConstant::$STARTED_SHIFTING_SHIPMENT_ORDER);

        $this->entityManager->persist($shiftingShipmentOrderEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $shiftingShipmentOrderEntity;
    }

    public function updateStatus(ShiftingShipmentOrderStatusUpdateRequest $request)
    {
        $shiftingShipmentOrderEntity = $this->shiftingShipmentOrderEntityRepository->find($request->getId());

        if(!$shiftingShipmentOrderEntity)
        {
            return  $shiftingShipmentOrderEntity;
        }
        else
        {
            $shiftingShipmentOrderEntity = $this->autoMapping->mapToObject(ShiftingShipmentOrderStatusUpdateRequest::class, ShiftingShipmentOrderEntity::class,
                $request, $shiftingShipmentOrderEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $shiftingShipmentOrderEntity;
        }
    }

    public function filterShiftingShipmentOrders($request)
    {
        return $this->shiftingShipmentOrderEntityRepository->filterShiftingShipmentOrders($request);
    }

    public function delete(DeleteRequest $request)
    {
        $shiftingShipmentOrderEntity = $this->shiftingShipmentOrderEntityRepository->find($request->getId());

        if(!$shiftingShipmentOrderEntity)
        {
            return $shiftingShipmentOrderEntity;
        }
        else
        {
            // Before deleting the shifting order, make sure its status is stilled 'started'
            if($shiftingShipmentOrderEntity->getStatus() != ShiftingShipmentOrderStatusConstant::$STARTED_SHIFTING_SHIPMENT_ORDER)
            {
                return "Can't delete the shifting order because it is under procedure!";
            }
            else
            {
                $this->entityManager->remove($shiftingShipmentOrderEntity);
                $this->entityManager->flush();
            }

            return $shiftingShipmentOrderEntity;
        }
    }

}