<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProxyEntity;
use App\Manager\ProxyManager;
use App\Request\ProxyCreateRequest;
use App\Response\ProxyCreateResponse;
use App\Response\ProxyGetResponse;

class ProxyService
{
    private $autoMapping;
    private $proxyManager;

    public function __construct(AutoMapping $autoMapping, ProxyManager $proxyManager)
    {
        $this->autoMapping = $autoMapping;
        $this->proxyManager = $proxyManager;
    }

    public function create(ProxyCreateRequest $request)
    {
        $proxyResult = $this->proxyManager->create($request);

        return $this->autoMapping->map(ProxyEntity::class, ProxyCreateResponse::class, $proxyResult);
    }

    public function getAllProxies()
    {
        $proxiesResponse = [];

        $proxies = $this->proxyManager->getAllProxies();

        foreach($proxies as $proxy)
        {
            $proxiesResponse[] = $this->autoMapping->map('array', ProxyGetResponse::class, $proxy);
        }

        return $proxiesResponse;
    }

}