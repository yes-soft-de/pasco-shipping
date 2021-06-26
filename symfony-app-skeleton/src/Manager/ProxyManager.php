<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ProxyEntity;
use App\Repository\ProxyEntityRepository;
use App\Request\ProxyCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ProxyManager
{
    private $autoMapping;
    private $entityManager;
    private $proxyEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ProxyEntityRepository $proxyEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->proxyEntityRepository = $proxyEntityRepository;
    }

    public function create(ProxyCreateRequest $request)
    {
        $proxyEntity = $this->autoMapping->map(ProxyCreateRequest::class, ProxyEntity::class, $request);
        
        $this->entityManager->persist($proxyEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $proxyEntity;
    }

    public function getAllProxies()
    {
        return $this->proxyEntityRepository->getAllProxies();
    }

}