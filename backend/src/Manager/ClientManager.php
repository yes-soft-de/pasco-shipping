<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\ClientProfileEntity;
use App\Repository\UserEntityRepository;
use App\Repository\ClientProfileEntityRepository;
use App\Request\ClientFilterRequest;
use App\Request\ClientProfileUpdateRequest;
use App\Request\ClientRegisterByDashboardRequest;
use App\Request\DeleteRequest;
use App\Request\ClientRegisterRequest;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ClientManager
{
    private $autoMapping;
    private $entityManager;
    private $encoder;
    private $userRepository;
    private $clientProfileEntityRepository;
    private $markManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager,
                                UserPasswordEncoderInterface $encoder, UserEntityRepository $userRepository, ClientProfileEntityRepository $clientProfileEntityRepository,
                                MarkManager $markManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->encoder = $encoder;
        $this->userRepository = $userRepository;
        $this->clientProfileEntityRepository = $clientProfileEntityRepository;
        $this->markManager = $markManager;
    }

    public function clientRegister(ClientRegisterRequest $request)
    {
        // First, create the user
        $userResult = $this->getUserByUserID($request->getUserID());

        if ($userResult == null) 
        {
            $userRegister = $this->autoMapping->map(ClientRegisterRequest::class, UserEntity::class, $request);

            $user = new UserEntity($request->getUserID());

            if ($request->getPassword())
            {
                $userRegister->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
            }

            if ($request->getRoles() == null)
            {
                $request->setRoles(['user']);
            }

            $userRegister->setRoles($request->getRoles());

            $this->entityManager->persist($userRegister);
            $this->entityManager->flush();
            $this->entityManager->clear();

            // Second, create the client's profile
            $clientProfile = $this->getProfileByClientID($request->getUserID());

            if ($clientProfile == null)
            {
                $clientProfile = $this->autoMapping->map(ClientRegisterRequest::class, ClientProfileEntity::class, $request);

                $clientProfile->setUserID($userRegister->getId());

                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return $userRegister;
        }
        else
        {
            $clientProfile = $this->getProfileByClientID($userResult['id']);

            if ($clientProfile == null)
            {
                $clientProfile = $this->autoMapping->map(ClientRegisterRequest::class, ClientProfileEntity::class, $request);
                
                $clientProfile->setUserID($userResult['id']);

                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return true;
        }
    }

    public function clientRegisterByDashboard(ClientRegisterByDashboardRequest $request)
    {
        // First, create the user
        $userResult = $this->getUserByUserID($request->getUserID());

        if ($userResult == null) 
        {
            $userRegister = $this->autoMapping->map(ClientRegisterByDashboardRequest::class, UserEntity::class, $request);

            $user = new UserEntity($request->getUserID());

            if ($request->getPassword())
            {
                $userRegister->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
            }

            if ($request->getRoles() == null)
            {
                $request->setRoles(['user']);
            }

            $userRegister->setRoles($request->getRoles());

            $this->entityManager->persist($userRegister);
            $this->entityManager->flush();
            $this->entityManager->clear();

            // Second, create the client's profile
            $clientProfile = $this->getProfileByClientID($request->getUserID());

            if ($clientProfile == null)
            {
                $clientProfile = $this->autoMapping->map(ClientRegisterByDashboardRequest::class, ClientProfileEntity::class, $request);

                $clientProfile->setUserID($userRegister->getId());

                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return $userRegister;
        }
        else
        {
            $clientProfile = $this->getProfileByClientID($userResult['id']);

            if ($clientProfile == null)
            {
                $clientProfile = $this->autoMapping->map(ClientRegisterByDashboardRequest::class, ClientProfileEntity::class, $request);
                
                $clientProfile->setUserID($userResult['id']);

                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return true;
        }
    }

    // public function userProfileCreate(UserProfileCreateRequest $request)
    // {
    //    $userProfile = $this->getProfileByUserID($request->getUserID());
    //    if ($userProfile == null) {
    //         $userProfile = $this->autoMapping->map(UserProfileCreateRequest::class, UserProfileEntity::class, $request);

    //         $this->entityManager->persist($userProfile);
    //         $this->entityManager->flush();
    //         $this->entityManager->clear();

    //         return $userProfile;
    // }
    //     else {
    //         return true;
    //    }
    // }

    public function clientProfileUpdate(ClientProfileUpdateRequest $request)
    {
        $item = $this->clientProfileEntityRepository->getClientProfile($request->getUserID());
        
        if ($item)
        {
            $item = $this->autoMapping->mapToObject(ClientProfileUpdateRequest::class, ClientProfileEntity::class, $request, $item);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function getProfileByClientID($userID)
    {
        return $this->clientProfileEntityRepository->getProfileByUserID($userID);
    }

    public function getUserByUserID($userID)
    {
        return $this->userRepository->getUserByUserID($userID);
    }

    public function getFullClientInfoByUserID($userID)
    {
        return $this->userRepository->getFullClientInfoByUserID($userID);
    }

    public function getUserByEmail($email)
    {
        return $this->userRepository->getUserByEmail($email);
    }

    public function getAllClientsProfiles()
    {
        $clients = $this->userRepository->getAllClients();
        
        foreach ($clients as $key=>$val)
        {
            $clients[$key]['marks'] = $this->markManager->getAllMarksByUser($clients[$key]['id']);
        }

        return $clients;
    }

    public function filterClients(ClientFilterRequest $request)
    {
        return $this->clientProfileEntityRepository->filterClients($request->getName());
    }

    public function getCountOfAllClientsProfiles()
    {
        return count($this->clientProfileEntityRepository->findAll());
    }

    public function deleteClientById(DeleteRequest $request)
    {
        // First, delete its profile if exists
        $clientProfile = $this->clientProfileEntityRepository->findOneBy(["userID"=>$request->getId()]);

        if(!$clientProfile)
        {

        }
        else
        {
            $this->entityManager->remove($clientProfile);
            $this->entityManager->flush();
        }

        // Then delete its record from the User table
        $userEntity = $this->userRepository->find($request->getId());

        if(!$userEntity)
        {

        }
        else
        {
            $this->entityManager->remove($userEntity);
            $this->entityManager->flush();

            return $userEntity;
        }
    }

}