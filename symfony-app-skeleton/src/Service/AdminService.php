<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Manager\AdminManager;
use App\Request\AdminCreateRequest;
use App\Response\AdminCreateResponse;
use App\Response\AdminGetResponse;
use App\Response\UserRegisterResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class AdminService implements AdminServiceInterface
{
    private $autoMapping;
    private $adminManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, AdminManager $adminManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->adminManager = $adminManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function adminCreate(AdminCreateRequest $request)
    {
        $adminCreate = $this->adminManager->adminCreate($request);

        if ($adminCreate instanceof UserEntity) 
        {
            return $this->autoMapping->map(UserEntity::class, AdminCreateResponse::class, $adminCreate);
        }

        if ($adminCreate == true) 
        {  
            $user = $this->adminManager->getAdminByUserID($request->getUserID());

            $user['found']="yes";
            
            return $user;
        }
    }

    public function getAllEmployees()
    {
        $employeesResponse = [];

        $employees = $this->adminManager->getAllEmployees();
        
        foreach ($employees as $employee)
        {
            if ($employee['image'])
            {
                $employee['image'] = $this->params . $employee['image'];
            }

            $employeesResponse[] = $this->autoMapping->map('array', AdminGetResponse::class, $employee);
        }

        return $employeesResponse;
    }

    public function getAllAdministrators()
    {
        $adminsResponse = [];

        $administrators = $this->adminManager->getAllAdministrators();
        
        foreach ($administrators as $admin)
        {
            if ($admin['image'])
            {
                $admin['image'] = $this->params . $admin['image'];
            }

            $adminsResponse[] = $this->autoMapping->map('array', AdminGetResponse::class, $admin);
        }

        return $adminsResponse;
    }

    public function deleteAdminById($request)
    {
        $result = $this->adminManager->deleteAdminById($request);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $result);
    }

}