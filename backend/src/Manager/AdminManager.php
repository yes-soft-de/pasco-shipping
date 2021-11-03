<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\AdminProfileEntity;
use App\Entity\UserEntity;
use App\Repository\AdminProfileEntityRepository;
use App\Repository\UserEntityRepository;
use App\Request\AdminCreateRequest;
use App\Request\AdminProfileUpdateRequest;
use App\Request\DeleteRequest;
use App\Request\EmployeeProfileUpdateRequest;
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

    public function adminProfileUpdate(AdminProfileUpdateRequest $request)
    {
        $adminProfileEntity = $this->adminProfileEntityRepository->getAdminProfileByUserID($request->getUserID());

        if ($adminProfileEntity)
        {
            $adminProfileEntity = $this->autoMapping->mapToObject(AdminProfileUpdateRequest::class, AdminProfileEntity::class, $request, $adminProfileEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $adminProfileEntity;
        }
    }

    public function employeeProfileUpdateByDashboard(EmployeeProfileUpdateRequest $request)
    {
        $employeeProfileEntity = $this->adminProfileEntityRepository->getAdminProfileByUserID($request->getUserID());

        if($employeeProfileEntity)
        {
            $employeeProfileEntity = $this->autoMapping->mapToObject(EmployeeProfileUpdateRequest::class, AdminProfileEntity::class, $request, $employeeProfileEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $employeeProfileEntity;
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

    public function getAllEmployees()
    {
        return $this->adminProfileEntityRepository->getAllEmployees();
    }

    public function getAllAdministrators()
    {
        return $this->adminProfileEntityRepository->getAllAdministrators();
    }

    // This function for delete admin and employee
    public function deleteAdminById(DeleteRequest $request)
    {
        // First, delete its profile if exists
        $clientProfile = $this->adminProfileEntityRepository->findOneBy(["userID"=>$request->getId()]);

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
