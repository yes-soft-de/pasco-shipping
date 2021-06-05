<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProxyEntity;
use App\Manager\ProxyManager;
use App\Request\ProxyCreateRequest;
use App\Response\ProxyCreateResponse;
use App\Response\ProxyGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ProxyService
{
    private $autoMapping;
    private $proxyManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ProxyManager $proxyManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->proxyManager = $proxyManager;
        $this->params = $params->get('upload_base_url') . '/';
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
            $proxy['createdByUserImage'] = $this->params . $proxy['createdByUserImage'];

            $proxy['updatedByUserImage'] = $this->params . $proxy['updatedByUserImage'];

            $proxiesResponse[] = $this->autoMapping->map('array', ProxyGetResponse::class, $proxy);
        }

        return $proxiesResponse;
    }

}