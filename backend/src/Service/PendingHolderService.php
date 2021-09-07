<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\PendingHolderEntity;
use App\Manager\PendingHolderManager;
use App\Request\PendingHolderCreateRequest;
use App\Response\PendingHolderCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class PendingHolderService
{
    private $autoMapping;
    private $pendingHolderManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, PendingHolderManager $pendingHolderManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->pendingHolderManager = $pendingHolderManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(PendingHolderCreateRequest $request)
    {
        $pendingHolderResult = $this->pendingHolderManager->create($request);

        return $this->autoMapping->map(PendingHolderEntity::class, PendingHolderCreateResponse::class, $pendingHolderResult);
    }

}