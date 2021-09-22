<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\PortsEntity;
use App\Manager\PortsManager;
use App\Request\PortsCreateRequest;
use App\Request\PortsUpdateRequest;
use App\Response\PortsCreateResponse;
use App\Response\PortsFilterResponse;
use App\Response\PortsUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class PortsService
{
    private $autoMapping;
    private $portsManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, PortsManager $portsManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->portsManager = $portsManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(PortsCreateRequest $request)
    {
        $portsResult = $this->portsManager->create($request);

        return $this->autoMapping->map(PortsEntity::class, PortsCreateResponse::class, $portsResult);
    }

    public function update(PortsUpdateRequest $request)
    {
        $portsResult = $this->portsManager->update($request);

        return $this->autoMapping->map(PortsEntity::class, PortsUpdateResponse::class, $portsResult);
    }

    public function filterPorts($request)
    {
        $portsResponse = [];

        $portsResults = $this->portsManager->filterPorts($request);

        if($portsResults)
        {
            foreach($portsResults as $port)
            {
                if($port['createdByUserImage'])
                {
                    $port['createdByUserImage'] = $this->params . $port['createdByUserImage'];
                }

                if($port['updatedByUserImage'])
                {
                    $port['updatedByUserImage'] = $this->params . $port['updatedByUserImage'];
                }

                $portsResponse[] = $this->autoMapping->map('array', PortsFilterResponse::class, $port);
            }
        }

        return $portsResponse;
    }

    public function delete($request)
    {
        $result = $this->portsManager->delete($request);

        if($result instanceof PortsEntity)
        {
            return $this->autoMapping->map(PortsEntity::class, PortsUpdateResponse::class, $result);
        }
        else
        {
            return $result;
        }
    }

}