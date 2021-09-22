<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\PortsEntity;
use App\Repository\PortsEntityRepository;
use App\Request\DeleteRequest;
use App\Request\PortsCreateRequest;
use App\Request\PortsUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class PortsManager
{
    private $autoMapping;
    private $entityManager;
    private $portsEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, PortsEntityRepository $portsEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->portsEntityRepository = $portsEntityRepository;
    }

    public function create(PortsCreateRequest $request)
    {
        $portsEntity = $this->autoMapping->map(PortsCreateRequest::class, PortsEntity::class, $request);

        $this->entityManager->persist($portsEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $portsEntity;
    }

    public function update(PortsUpdateRequest $request)
    {
        $portsEntity = $this->portsEntityRepository->find($request->getId());

        if(!$portsEntity)
        {

        }
        else
        {
            $portsEntity = $this->autoMapping->mapToObject(PortsUpdateRequest::class, PortsEntity::class, $request, $portsEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $portsEntity;
        }
    }

    public function filterPorts($request)
    {
        return $this->portsEntityRepository->filterPorts($request);
    }

    public function delete(DeleteRequest $request)
    {
        $portsEntity = $this->portsEntityRepository->find($request->getId());

        if(!$portsEntity)
        {
            return $portsEntity;
        }
        else
        {
            $this->entityManager->remove($portsEntity);
            $this->entityManager->flush();

            return $portsEntity;
        }
    }

}