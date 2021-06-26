<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\ClientProfileEntity;
use App\Manager\ClientManager;
use App\Request\ClientProfileUpdateRequest;
use App\Request\ClientRegisterRequest;
use App\Response\ClientProfileResponse;
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

    public function getAllClientProfiles()
    {
        return $this->clientManager->getAllClientsProfiles();
    }

    public function deleteClientById($request)
    {
        $result = $this->clientManager->deleteClientById($request);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $result);
    }

}