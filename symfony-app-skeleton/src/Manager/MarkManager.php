<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\MarkEntity;
use App\Repository\MarkEntityRepository;
use App\Request\DeleteRequest;
use App\Request\MarkCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class MarkManager
{
    private $autoMapping;
    private $entityManager;
    private $shipmentOrderManager;
    private $markEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, MarkEntityRepository $markEntityRepository,
     ShipmentOrderManager $shipmentOrderManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->markEntityRepository = $markEntityRepository;
    }

    public function create(MarkCreateRequest $request)
    {
        // First, check if the mark number exist
        $result = $this->getMarkByMarkNumber($request->getMarkNumber());

        if($result)
        {
            // Requested mark number already existed!
            return "Requested mark number already existed!";
        }
        else
        {
            // Request mark number does not exist, so create it.
            $markEntity = $this->autoMapping->map(MarkCreateRequest::class, MarkEntity::class, $request);

            $this->entityManager->persist($markEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $markEntity;
        }
    }

    public function getMarkByMarkNumber($markNumber)
    {
        return $this->markEntityRepository->findBy(["markNumber"=>$markNumber]);
    }

    public function getAllMarksByUser($userID)
    {
        return $this->markEntityRepository->getAllMarksByUser($userID);
    }

    public function deleteMarkById(DeleteRequest $request)
    {
        $item = $this->markEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            //Check if the mark isn't being used yet
            $result = $this->shipmentOrderManager->getShipmentOrderByMarkID($request->getId());
            
            if(!$result)
            {
                //its safe to delete the mark
                $this->entityManager->remove($item);
                $this->entityManager->flush();
            }
            else
            {
                return "The mark is being used. We can not delete it!";
            }
        }

        return $item;
    }

}