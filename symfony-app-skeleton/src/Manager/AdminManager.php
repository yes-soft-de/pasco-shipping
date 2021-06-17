<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\AdminProfileEntity;
use App\Entity\UserEntity;
use App\Repository\AdminProfileEntityRepository;
use App\Repository\UserEntityRepository;
use App\Request\AdminCreateRequest;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AdminManager
{
    private $autoMapping;
    private $entityManager;
    private $encoder;
    private $userRepository;
    private $adminProfileEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, UserPasswordEncoderInterface $encoder,
                                UserEntityRepository $userRepository, AdminProfileEntityRepository $adminProfileEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->encoder = $encoder;
        $this->userRepository = $userRepository;
        $this->adminProfileEntityRepository = $adminProfileEntityRepository;
    }

    public function adminCreate(AdminCreateRequest $request)
    {
        $adminEntity = $this->getAdminByUserID($request->getUserID());
        
        if ($adminEntity == null) 
        {
            $adminCreate = $this->autoMapping->map(AdminCreateRequest::class, UserEntity::class, $request);

            $user = new UserEntity($request->getUserID());

            if ($request->getPassword())
            {
                $adminCreate->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
            }

            if ($request->getRoles() == null)
            {
                $request->setRoles(['ROLE_ADMIN']);
            }

            $adminCreate->setRoles($request->getRoles());

            $this->entityManager->persist($adminCreate);
            $this->entityManager->flush();
            $this->entityManager->clear();

            // Second, we check if there is a profile with the same userID
            // If not, we will create a one
            $adminProfile = $this->getProfileByUserID($request->getUserID());

            if($adminProfile == null)
            {
                $adminProfile = $this->autoMapping->map(AdminCreateRequest::class, AdminProfileEntity::class, $request);

                $adminProfile->setUserID($adminCreate->getId());

                $this->entityManager->persist($adminProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return $adminCreate;
        }
        else 
        {
            // admin exists, so we have also to check if the profile is exist too
            $adminProfile = $this->getProfileByUserID($adminEntity['id']);

            if ($adminProfile == null) 
            {
                $adminProfile = $this->autoMapping->map(AdminCreateRequest::class, AdminProfileEntity::class, $request);

                $adminProfile->setUserID($adminEntity['id']);

                $this->entityManager->persist($adminProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return true;
        }
    }

    public function getAdminByUserID($userID)
    {
        return $this->userRepository->getUserByUserID($userID);
    }

    public function getProfileByUserID($userID)
    {
        return $this->adminProfileEntityRepository->getProfileByUserID($userID);
    }

    public function getCountOfAllAdmins()
    {
        return count($this->adminProfileEntityRepository->findAll());
    }
}
