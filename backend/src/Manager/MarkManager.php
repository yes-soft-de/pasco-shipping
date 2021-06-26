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
    private $markEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, MarkEntityRepository $markEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
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
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }

}