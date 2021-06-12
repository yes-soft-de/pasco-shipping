<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Repository\UserEntityRepository;
use App\Request\UserUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class MainManager
{
    const WAITING_SHIPMENT_STATUS = "waiting";
    const ACCEPTED_SHIPMENT_STATUS = "accepted";

    const FLIGHT_TRAVEL_TYPE = "flight";
    const CRUISE_TRAVEL_TYPE = "cruise";

    private $autoMapping;
    private $entityManager;
    private $userEntityRepository;
    private $encoder;
    private $shipmentOrderManager;
    private $travelManager;
    private $userManager;
    private $adminManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, UserPasswordEncoderInterface $encoder, UserEntityRepository $userEntityRepository,
    ShipmentOrderManager $shipmentOrderManager, TravelManager $travelManager, UserManager $userManager, AdminManager $adminManager)
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
        $statisticsResponse["orders"]["waitingOrders"] = $this->shipmentOrderManager->getCountOfShipmentsOrdersByStatus($this::WAITING_SHIPMENT_STATUS);
        $statisticsResponse["orders"]["acceptedOrders"] = $this->shipmentOrderManager->getCountOfShipmentsOrdersByStatus($this::ACCEPTED_SHIPMENT_STATUS);

        $statisticsResponse["travels"]["total"] = $this->travelManager->getCountOfAllTravels();
        $statisticsResponse["travels"]["flight"] = $this->travelManager->getCountOfTravelsByType($this::FLIGHT_TRAVEL_TYPE);
        $statisticsResponse["travels"]["cruise"] = $this->travelManager->getCountOfTravelsByType($this::CRUISE_TRAVEL_TYPE);

        $statisticsResponse["users"]["customers"] = $this->userManager->getCountOfAllProfiles();
        $statisticsResponse["users"]["employees"] = $this->adminManager->getCountOfAllAdmins();
        $statisticsResponse["users"]["totals"] = $statisticsResponse["users"]["customers"] + $statisticsResponse["users"]["employees"];

        return $statisticsResponse;
    }

}