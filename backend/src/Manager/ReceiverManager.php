<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReceiverEntity;
use App\Repository\ReceiverEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ReceiverCreateByDashboardRequest;
use App\Request\ReceiverCreateRequest;
use App\Request\ReceiverFilterRequest;
use App\Request\ReceiverUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReceiverManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $receiverEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ReceiverEntityRepository $receiverEntityRepository,
    ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->receiverEntityRepository = $receiverEntityRepository;
    }

    public function create(ReceiverCreateRequest $request)
    {
        $receiverEntity = $this->autoMapping->map(ReceiverCreateRequest::class, ReceiverEntity::class, $request);
        
        $this->entityManager->persist($receiverEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $receiverEntity;
    }

    public function createByDashboard(ReceiverCreateByDashboardRequest $request)
    {
        $receiverEntity = $this->autoMapping->map(ReceiverCreateByDashboardRequest::class, ReceiverEntity::class, $request);
        
        $this->entityManager->persist($receiverEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $receiverEntity;
    }

    public function update(ReceiverUpdateRequest $request)
    {
        $receiverEntity = $this->receiverEntityRepository->find($request->getId());

        if(!$receiverEntity)
        {
            return $receiverEntity;
        }
        else
        {
            $receiverEntity = $this->autoMapping->mapToObject(ReceiverUpdateRequest::class, ReceiverEntity::class, $request, $receiverEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $receiverEntity;
        }
    }

    public function filterReceivers(ReceiverFilterRequest $request)
    {
        return $this->receiverEntityRepository->filterReceivers($request->getClientUserID(), $request->getCreatedBy());
    }

    public function getMyReceivers($clientUserID)
    {
        return $this->receiverEntityRepository->getReceiversByClientUserID($clientUserID);
    }

    public function getShipmentOrderByReceiver($receiverID)
    {
        return $this->shipmentOrderManager->getShipmentOrderByReceiver($receiverID);
    }

    public function deleteReceiverById(DeleteRequest $request)
    {
        $receiverEntity = $this->receiverEntityRepository->find($request->getId());

        if(!$receiverEntity)
        {
            return $receiverEntity;
        }
        else
        {
            //Check if the receiver isn't being used yet
            $result = $this->getShipmentOrderByReceiver($request->getId());

            if(!$result)
            {
                //its safe to delete the mark
                $this->entityManager->remove($receiverEntity);
                $this->entityManager->flush();
            }
            else
            {
                return "The receiver is being used. We can not delete it!";
            }
        }

        return $receiverEntity;
    }

}