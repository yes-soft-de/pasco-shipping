<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AdminProfileEntity;
use App\Entity\UserEntity;
use App\Manager\AdminManager;
use App\Request\AdminCreateRequest;
use App\Request\AdminProfileUpdateRequest;
use App\Request\EmployeeProfileUpdateRequest;
use App\Request\EmployeeRoleUpdateRequest;
use App\Response\AdminCreateResponse;
use App\Response\AdminGetResponse;
use App\Response\EmployeeGetResponse;
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

    public function adminProfileUpdate(AdminProfileUpdateRequest $request)
    {
        $adminProfileEntity = $this->adminManager->adminProfileUpdate($request);

        return $this->autoMapping->map(AdminProfileEntity::class, AdminGetResponse::class, $adminProfileEntity);
    }

    public function employeeProfileUpdateByDashboard(EmployeeProfileUpdateRequest $request)
    {
        $employeeProfileEntity = $this->adminManager->employeeProfileUpdateByDashboard($request);

        return $this->autoMapping->map(AdminProfileEntity::class, EmployeeGetResponse::class, $employeeProfileEntity);
    }

    public function employeeRoleUpdateByDashboard(EmployeeRoleUpdateRequest $request)
    {
        $employeeUserResult = $this->adminManager->employeeRoleUpdateByDashboard($request);

        if($employeeUserResult instanceof UserEntity)
        {
            return $this->autoMapping->map(UserEntity::class, EmployeeGetResponse::class, $employeeUserResult);
        }

        return $employeeUserResult;
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

    public function getProfileByUserID($userID)
    {
        $item = $this->adminManager->getProfileByUserID($userID);

        if($item['image'])
        {
            $item['image'] = $this->params . $item['image'];
        }

        return $this->autoMapping->map('array', AdminGetResponse::class, $item);
    }

    public function deleteAdminById($request)
    {
        $result = $this->adminManager->deleteAdminById($request);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $result);
    }

}