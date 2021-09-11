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
        $gunnyShipmentEntity = $this->autoMapping->map(GunnyShipmentCreateRequest::class, GunnyShipmentEntity::class, $request);

        $this->entityManager->persist($gunnyShipmentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        // Now, update the status of the gunny if it is full
        if($request->getGunnyStatus() == GunnyStatusConstant::$FULL_GUNNY_STATUS)
        {
            $this->updateGunnyStatus($request->getGunnyID(), $request->getGunnyStatus(), $request->getCreatedBy());
        }

        //Check how much quantity does remain without pocketing into gunny
        $result = $this->checkHowShipmentQuantityRemained($gunnyShipmentEntity->getShipmentID(), $request->getQuantity());

        $result['gunnyShipment'] = $gunnyShipmentEntity;

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

    public function checkHowShipmentQuantityRemained($shipmentID, $storedQuantity)
    {
        $result = [];

        $shipment = $this->shipmentOrderManager->getShipmentOrderById($shipmentID);

        if($shipment)
        {
            $remainedQuantity = $shipment['quantity'] - $storedQuantity;

            if($remainedQuantity == 0)
            {
                $result['remainedQuantity'] = $remainedQuantity;
                $result['completedStored'] = true;
            }
            elseif($remainedQuantity > 0)
            {
                $result['remainedQuantity'] = $remainedQuantity;
                $result['completedStored'] = false;
            }

            return $result;
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