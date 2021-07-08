<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UnitEntity;
use App\Manager\UnitManager;
use App\Request\UnitCreateRequest;
use App\Request\UnitUpdateRequest;
use App\Response\UnitCreateResponse;
use App\Response\UnitGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class UnitService
{
    private $autoMapping;
    private $unitManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, UnitManager $unitManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->unitManager = $unitManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(UnitCreateRequest $request)
    {
        $unitResult = $this->unitManager->create($request);

        return $this->autoMapping->map(UnitEntity::class, UnitCreateResponse::class, $unitResult);
    }

    public function update(UnitUpdateRequest $request)
    {
        $unitResult = $this->unitManager->update($request);

        return $this->autoMapping->map(UnitEntity::class, UnitGetResponse::class, $unitResult);
    }

    public function getAllUnits()
    {
        $unitResponse = [];

        $units = $this->unitManager->getAllUnits();

        foreach ($units as $unit)
        {
            if($unit['createdByUserImage'])
            {
                $unit['createdByUserImage'] = $this->params . $unit['createdByUserImage'];
            }

            if($unit['updatedByUserImage'])
            {
                $unit['updatedByUserImage'] = $this->params . $unit['updatedByUserImage'];
            }

            $unitResponse[] = $this->autoMapping->map('array', UnitGetResponse::class, $unit);
        }

        return $unitResponse;
    }

    public function deleteUnitById($request)
    {
        $result = $this->unitManager->deleteUnitById($request);

        return $this->autoMapping->map(UnitEntity::class, UnitGetResponse::class, $result);
    }

}