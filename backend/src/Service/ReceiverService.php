<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ReceiverEntity;
use App\Manager\ReceiverManager;
use App\Request\ReceiverCreateByDashboardRequest;
use App\Request\ReceiverCreateRequest;
use App\Request\ReceiverFilterRequest;
use App\Response\ReceiverCreateResponse;
use App\Response\ReceiverGetByDashboardResponse;
use App\Response\ReceiverGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ReceiverService
{
    private $autoMapping;
    private $receiverManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ReceiverManager $receiverManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->receiverManager = $receiverManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ReceiverCreateRequest $request)
    {
        $receiverResult = $this->receiverManager->create($request);

        return $this->autoMapping->map(ReceiverEntity::class, ReceiverCreateResponse::class, $receiverResult);
    }

    public function createByDashboard(ReceiverCreateByDashboardRequest $request)
    {
        $receiverResult = $this->receiverManager->createByDashboard($request);

        return $this->autoMapping->map(ReceiverEntity::class, ReceiverCreateResponse::class, $receiverResult);
    }

    public function filterReceivers(ReceiverFilterRequest $request)
    {
        $receiversResponse = [];

        $receivers = $this->receiverManager->filterReceivers($request);
        
        foreach($receivers as $receiver)
        {
            if($receiver['createdByUserImage'])
            {
                $receiver['createdByUserImage'] = $this->params . $receiver['createdByUserImage'];
            }

            if($receiver['updatedByUserImage'])
            {
                $receiver['updatedByUserImage'] = $this->params . $receiver['updatedByUserImage'];
            }

            $receiversResponse[] = $this->autoMapping->map('array', ReceiverGetByDashboardResponse::class, $receiver);
        }

        return $receiversResponse;
    }

    public function getMyReceivers($clientUserID)
    {
        $receiversResponse = [];

        $receivers = $this->receiverManager->getMyReceivers($clientUserID);
        
        foreach($receivers as $receiver)
        {
            $receiversResponse[] = $this->autoMapping->map('array', ReceiverGetResponse::class, $receiver);
        }

        return $receiversResponse;
    }

}