<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\MainManager;
use App\Response\DeleteAllGetResponse;
use App\Response\StatisticsGetResponse;

class MainService
{
    private $autoMapping;
    private $mainManager;

    public function __construct(AutoMapping $autoMapping, MainManager $mainManager)
    {
        $this->autoMapping = $autoMapping;
        $this->mainManager = $mainManager;
    }

    public function findAll()
    {
        return $this->mainManager->findAll();
    }

    public function getStatistics()
    {
        $statistics = $this->mainManager->getStatistics();

        return $this->autoMapping->map('array', StatisticsGetResponse::class, $statistics);
    }

    public function deleteAllShipments()
    {
        $result = [];

        $result['numbersOfItemDeleted'] = $this->mainManager->deleteAllShipments();

        return $this->autoMapping->map('array', DeleteAllGetResponse::class, $result);
    }

}