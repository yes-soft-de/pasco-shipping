<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReceiverEntity;
use App\Repository\ReceiverEntityRepository;
use App\Request\ReceiverCreateByDashboardRequest;
use App\Request\ReceiverCreateRequest;
use App\Request\ReceiverFilterRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReceiverManager
{
    private $autoMapping;
    private $entityManager;
    private $receiverEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ReceiverEntityRepository $receiverEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
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

    public function filterReceivers(ReceiverFilterRequest $request)
    {
        return $this->receiverEntityRepository->filterReceivers($request->getClientUserID(), $request->getCreatedBy());
    }

    public function getMyReceivers($clientUserID)
    {
        return $this->receiverEntityRepository->getReceiversByClientUserID($clientUserID);
    }

}