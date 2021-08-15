<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\ClientProfileEntity;
use App\Manager\ClientManager;
use App\Request\ClientFilterRequest;
use App\Request\ClientProfileUpdateRequest;
use App\Request\ClientRegisterByDashboardRequest;
use App\Request\ClientRegisterRequest;
use App\Response\ClientFullInfoGetResponse;
use App\Response\ClientProfileResponse;
use App\Response\ClientRegisterResponse;
use App\Response\UserRegisterResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ClientService
{
    private $autoMapping;
    private $clientManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ClientManager $clientManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->clientManager = $clientManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function clientRegister(ClientRegisterRequest $request)
    {
        $userRegister = $this->clientManager->clientRegister($request);

        if ($userRegister instanceof UserEntity) 
        {
            return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userRegister);
        }
        elseif ($userRegister == true) 
        {  
            $user = $this->clientManager->getUserByUserID($request->getUserID());

            $user['found']="yes";

            return $user;
        }
    }

    public function clientRegisterByDashboard(ClientRegisterByDashboardRequest $request)
    {
        $userRegister = $this->clientManager->clientRegisterByDashboard($request);

        if ($userRegister instanceof UserEntity) 
        {
            return $this->autoMapping->map(UserEntity::class, ClientRegisterResponse::class, $userRegister);
        }
        elseif ($userRegister == true) 
        {  
            $user = $this->clientManager->getUserByUserID($request->getUserID());

            $user['found']="yes";

            return $user;
        }
    }

    // public function userProfileCreate(UserProfileCreateRequest $request)
    // {
    //     $userProfile = $this->userManager->userProfileCreate($request);

    //     if ($userProfile instanceof UserProfileEntity) {

    //         return $this->autoMapping->map(UserProfileEntity::class,UserProfileCreateResponse::class, $userProfile);
    //     }
    //     elseif ($userProfile == true) 
    //     {
    //         $user = $this->getUserProfileByUserID($request->getUserID());
    //         return $user;
    //     }
    // }

    public function clientProfileUpdate(ClientProfileUpdateRequest $request)
    {
        $item = $this->clientManager->clientProfileUpdate($request);

        return $this->autoMapping->map(ClientProfileEntity::class, ClientProfileResponse::class, $item);
    }

    public function getClientProfileByUserID($userID)
    {
        $item = $this->clientManager->getProfileByClientID($userID);

        if($item['image'])
        {
            $item['image'] = $this->params . $item['image'];
        }

        return $this->autoMapping->map('array', ClientProfileResponse::class, $item);
    }

    public function getFullClientInfoByUserID($userID)
    {
        $item = $this->clientManager->getFullClientInfoByUserID($userID);

        if($item['image'])
        {
            $item['image'] = $this->params . $item['image'];
        }

        if($item['createdByUserImage'])
        {
            $item['createdByUserImage'] = $this->params . $item['createdByUserImage'];
        }

        if($item['updatedByUserImage'])
        {
            $item['updatedByUserImage'] = $this->params . $item['updatedByUserImage'];
        }

        return $this->autoMapping->map('array', ClientFullInfoGetResponse::class, $item);
    }

    public function getAllClientProfiles()
    {
        $clientsResponse = [];

        $clients = $this->clientManager->getAllClientsProfiles();

        foreach($clients as $client)
        {
            if($client['image'])
            {
                $client['image'] = $this->params . $client['image'];
            }

            if($client['createdByUserImage'])
            {
                $client['createdByUserImage'] = $this->params . $client['createdByUserImage'];
            }
            
            if($client['updatedByUserImage'])
            {
                $client['updatedByUserImage'] = $this->params . $client['updatedByUserImage'];
            }

            $clientsResponse[] = $this->autoMapping->map('array', ClientFullInfoGetResponse::class, $client);
        }

        return $clientsResponse;
    }

    public function filterClients(ClientFilterRequest $request)
    {
        $clientsResponse = [];

        $clients = $this->clientManager->filterClients($request);

        foreach($clients as $client)
        {
            if($client['image'])
            {
                $client['image'] = $this->params . $client['image'];
            }

            if($client['createdByUserImage'])
            {
                $client['createdByUserImage'] = $this->params . $client['createdByUserImage'];
            }
            
            if($client['updatedByUserImage'])
            {
                $client['updatedByUserImage'] = $this->params . $client['updatedByUserImage'];
            }

            $clientsResponse[] = $this->autoMapping->map('array', ClientFullInfoGetResponse::class, $client);
        }

        return $clientsResponse;
    }

    public function deleteClientById($request)
    {
        $result = $this->clientManager->deleteClientById($request);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $result);
    }

}