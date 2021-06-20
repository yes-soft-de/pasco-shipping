<?php

namespace App\Service;

use App\Request\AdminCreateRequest;

interface AdminServiceInterface
{
    public function adminCreate(AdminCreateRequest $request);

    public function getAllEmployees();

    public function getAllAdministrators();
    
    public function deleteAdminById($request);

}