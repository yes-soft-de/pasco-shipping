<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentOrderStatusConstant;
use App\Constant\TravelStatusConstant;
use App\Constant\TravelTypeConstant;
use App\Repository\UserEntityRepository;
use Exception;

class MainManager
{
    private $autoMapping;
    private $userEntityRepository;
    private $shipmentOrderManager;
    private $travelManager;
    private $userManager;
    private $adminManager;
    private $shipmentStatusManager;
    private $shipmentLogManager;
    private $shipmentLCLFinanceManager;
    private $trackManager;

    public function __construct(AutoMapping $autoMapping,UserEntityRepository $userEntityRepository, ShipmentOrderManager $shipmentOrderManager, TravelManager $travelManager,
                                ClientManager $userManager, AdminManager $adminManager, ShipmentStatusManager $shipmentStatusManager, ShipmentLogManager $shipmentLogManager,
                                ShipmentLCLFinanceManager $shipmentLCLFinanceManager, TrackManager $trackManager)
    {
        $this->autoMapping = $autoMapping;
        $this->userEntityRepository = $userEntityRepository;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->travelManager = $travelManager;
        $this->userManager = $userManager;
        $this->adminManager = $adminManager;
        $this->shipmentStatusManager = $shipmentStatusManager;
        $this->shipmentLogManager = $shipmentLogManager;
        $this->shipmentLCLFinanceManager = $shipmentLCLFinanceManager;
        $this->trackManager = $trackManager;
    }

    public function findAll()
    {
        return $this->userEntityRepository->findAll();
    }

    public function getStatistics()
    {
        $statisticsResponse = [];

        $statisticsResponse["orders"]["total"] = $this->shipmentOrderManager->getCountOfAllShipmentsOrders();
        $statisticsResponse["orders"]["waitingOrders"] = $this->shipmentOrderManager->getCountOfShipmentsOrdersByStatus(ShipmentOrderStatusConstant::$WAITING_SHIPMENT_STATUS);
        $statisticsResponse["orders"]["acceptedOrders"] = $this->shipmentOrderManager->getCountOfShipmentsOrdersByStatus(ShipmentOrderStatusConstant::$ACCEPTED_SHIPMENT_STATUS);

        $statisticsResponse["travels"]["total"] = $this->travelManager->getCountOfAllTravels();

        $statisticsResponse["travels"]["flight"]["total"] = $this->travelManager->getCountOfTravelsByType(TravelTypeConstant::$FLIGHT_TRAVEL_TYPE);
        $statisticsResponse["travels"]["flight"]["current"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$FLIGHT_TRAVEL_TYPE, TravelStatusConstant::$CURRENT_TRAVEL_STATUS));
        $statisticsResponse["travels"]["flight"]["started"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$FLIGHT_TRAVEL_TYPE, TravelStatusConstant::$STARTED_TRAVEL_STATUS));
        $statisticsResponse["travels"]["flight"]["released"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$FLIGHT_TRAVEL_TYPE, TravelStatusConstant::$RELEASED_TRAVEL_STATUS));
        
        $statisticsResponse["travels"]["cruise"]["total"] = $this->travelManager->getCountOfTravelsByType(TravelTypeConstant::$CRUISE_TRAVEL_TYPE);
        $statisticsResponse["travels"]["cruise"]["current"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$CRUISE_TRAVEL_TYPE, TravelStatusConstant::$CURRENT_TRAVEL_STATUS));
        $statisticsResponse["travels"]["cruise"]["started"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$CRUISE_TRAVEL_TYPE, TravelStatusConstant::$STARTED_TRAVEL_STATUS));
        $statisticsResponse["travels"]["cruise"]["released"] = count($this->travelManager->getTravelsByTypeAndStatus(TravelTypeConstant::$CRUISE_TRAVEL_TYPE, TravelStatusConstant::$RELEASED_TRAVEL_STATUS));

        $statisticsResponse["users"]["customers"] = $this->userManager->getCountOfAllClientsProfiles();
        $statisticsResponse["users"]["employees"] = $this->adminManager->getCountOfAllAdmins();

        $statisticsResponse["users"]["totals"] = $statisticsResponse["users"]["customers"] + $statisticsResponse["users"]["employees"];

        return $statisticsResponse;
    }

    public function deleteAllShipments()
    {
        $number = 0;

        try
        {
            $number = $this->shipmentOrderManager->deleteAllOrders();
            
            $number = $number + $this->shipmentStatusManager->deleteAllShipmentStatus();

            $number = $number + $this->trackManager->deleteAllTracks();

            $number = $number + $this->shipmentLCLFinanceManager->deleteAllShipmentLCLFinances();

            $number = $number + $this->shipmentLogManager->deleteAllShipmentsLogs();

            return $number;
        }
        catch (Exception $ex)
        {
            return $ex;
        }
    }

}