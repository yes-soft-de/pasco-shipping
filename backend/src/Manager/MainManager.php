<?php

namespace App\Manager;

use App\AutoMapping;
use App\Constant\ShipmentOrderStatusConstant;
use App\Constant\TravelStatusConstant;
use App\Constant\TravelTypeConstant;
use App\Entity\UserEntity;
use App\Repository\UserEntityRepository;
use App\Request\UserUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class MainManager
{
    private $autoMapping;
    private $entityManager;
    private $userEntityRepository;
    private $encoder;
    private $shipmentOrderManager;
    private $travelManager;
    private $userManager;
    private $adminManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, UserPasswordEncoderInterface $encoder, UserEntityRepository $userEntityRepository,
                                ShipmentOrderManager $shipmentOrderManager, TravelManager $travelManager, ClientManager $userManager, AdminManager $adminManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->userEntityRepository = $userEntityRepository;
        $this->encoder = $encoder;
        $this->shipmentOrderManager = $shipmentOrderManager;
        $this->travelManager = $travelManager;
        $this->userManager = $userManager;
        $this->adminManager = $adminManager;
    }

    public function update(UserUpdateRequest $request)
    {
        $userEntity = $this->userEntityRepository->find($request->getId());
        
        if(!$userEntity)
        {
            return  $userEntity;
        }
        else
        {
            $userEntity = $this->autoMapping->mapToObject(UserUpdateRequest::class, UserEntity::class, 
            $request, $userEntity);

            $userEntity->setPassword($this->encoder->encodePassword($userEntity, $request->getPassword()));

            $this->entityManager->flush();
            $this->entityManager->clear();
            
            return $userEntity;
        }
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

}