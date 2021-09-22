<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\GunnyStatusConstant;
use App\Entity\GunnyShipmentEntity;
use App\Repository\GunnyShipmentEntityRepository;
use App\Request\DeleteRequest;
use App\Request\GunnyShipmentCreateRequest;
use App\Request\GunnyStatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class GunnyShipmentManager
{
    private $autoMapping;
    private $entityManager;
    private $gunnyManager;
    private $shipmentOrderManager;
    private $gunnyShipmentEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, GunnyShipmentEntityRepository $gunnyShipmentEntityRepository, GunnyManager $gunnyManager,
    ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->gunnyManager = $gunnyManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->gunnyShipmentEntityRepository = $gunnyShipmentEntityRepository;
    }

    public function create(GunnyShipmentCreateRequest $request)
    {
        $result = [];

        $gunnyShipmentEntity = $this->autoMapping->map(GunnyShipmentCreateRequest::class, GunnyShipmentEntity::class, $request);

        // First we have to check if the desired quantity to be stored is not over the whole quantity
        $remainedQuantity = $this->checkIfQuantityOfShipmentCanBeStoredInGunny($request->getShipmentID(), $request->getQuantity());

        if($remainedQuantity >= 0)
        {
            $this->entityManager->persist($gunnyShipmentEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            // Now, update the status of the gunny if it is full
            if ($request->getGunnyStatus() == GunnyStatusConstant::$FULL_GUNNY_STATUS)
            {
                $this->updateGunnyStatus($request->getGunnyID(), $request->getGunnyStatus(), $request->getCreatedBy());
            }

            $result['remainedQuantity'] = (string) $remainedQuantity;
            $result['gunnyShipment'] = $this->getGunnyByShipmentIdAndTrackNumber($request->getShipmentID(), $request->getTrackNumber());
        }
        else
        {
            $result['remainedQuantity'] = "The stored quantity now will exceed the whole quantity!";
        }

        return $result;
    }

    public function updateGunnyStatus($gunnyID, $status, $updatedBy)
    {
        $gunnyStatusUpdateRequest = new GunnyStatusUpdateRequest();

        $gunnyStatusUpdateRequest->setId($gunnyID);
        $gunnyStatusUpdateRequest->setStatus($status);
        $gunnyStatusUpdateRequest->setUpdatedBy($updatedBy);

        $this->gunnyManager->updateStatus($gunnyStatusUpdateRequest);
    }

    public function getGunnyByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->gunnyShipmentEntityRepository->getGunnyByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
    }

    public function checkIfQuantityOfShipmentCanBeStoredInGunny($shipmentID, $quantity)
    {
        $shipment = $this->shipmentOrderManager->getShipmentOrderById($shipmentID);

        $result = $this->gunnyShipmentEntityRepository->getSumQuantityByShipmentID($shipmentID);

        if($result)
        {
            return $shipment['quantity'] - ($result[1] + $quantity);
        }
        else
        {
            return $shipment['quantity'] - $quantity >= 0;
        }
    }

    public function deleteGunnyShipmentById(DeleteRequest $request, $updatedGunnyStatusBy)
    {
        $gunnyShipmentEntity = $this->gunnyShipmentEntityRepository->find($request->getId());

        if(!$gunnyShipmentEntity)
        {

        }
        else
        {
            $this->entityManager->remove($gunnyShipmentEntity);
            $this->entityManager->flush();

            // Now, we check the status of the gunny, if it is full, we update it to be not full
            $gunnyStatus = $this->gunnyManager->getGunnyStatusByGunnyID($gunnyShipmentEntity->getGunnyID());

            if(!empty($gunnyStatus) && $gunnyStatus['status'] == GunnyStatusConstant::$FULL_GUNNY_STATUS)
            {
                $this->updateGunnyStatus($gunnyShipmentEntity->getGunnyID(), GunnyStatusConstant::$NOT_FULL_GUNNY_STATUS, $updatedGunnyStatusBy);
            }
        }

        return $gunnyShipmentEntity;
    }

}