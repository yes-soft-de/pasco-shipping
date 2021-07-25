<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ProxyEntity;
use App\Repository\ProxyEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ProxyCreateRequest;
use App\Request\ProxyUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ProxyManager
{
    private $autoMapping;
    private $entityManager;
    private $proxyEntityRepository;
    private $warehouseManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ProxyEntityRepository $proxyEntityRepository,
     WarehouseManager $warehouseManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->proxyEntityRepository = $proxyEntityRepository;
        $this->warehouseManager = $warehouseManager;
    }

    public function create(ProxyCreateRequest $request)
    {
        $proxyEntity = $this->autoMapping->map(ProxyCreateRequest::class, ProxyEntity::class, $request);
        
        $this->entityManager->persist($proxyEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $proxyEntity;
    }

    public function update(ProxyUpdateRequest $request)
    {
        $proxyEntity = $this->proxyEntityRepository->find($request->getId());

        if(!$proxyEntity)
        {
            return  $proxyEntity;
        }
        else
        {
            $proxyEntity = $this->autoMapping->mapToObject(ProxyUpdateRequest::class, ProxyEntity::class, $request, $proxyEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $proxyEntity;
        }
    }

    public function getAllProxies()
    {
        return $this->proxyEntityRepository->getAllProxies();
    }

    public function delete(DeleteRequest $request)
    {
        $proxyEntity = $this->proxyEntityRepository->find($request->getId());

        if(!$proxyEntity)
        {

        }
        else
        {
            // First, check if proxy isn't used yet.\
            $warehouses = $this->warehouseManager->getByProxyID($request->getId());

            if($warehouses)
            {
                return "Proxy is used. We can not delete it!";
            }
            else
            {
                $this->entityManager->remove($proxyEntity);
                $this->entityManager->flush();

                return $proxyEntity;
            }
        }
    }

}