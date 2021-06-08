<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SupplierEntity;
use App\Manager\SupplierManager;
use App\Request\SupplierCreateRequest;
use App\Request\SupplierUpdateRequest;
use App\Response\SupplierCreateResponse;
use App\Response\SupplierGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class SupplierService
{
    private $autoMapping;
    private $supplierManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, SupplierManager $supplierManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->supplierManager = $supplierManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(SupplierCreateRequest $request)
    {
        $supplierResult = $this->supplierManager->create($request);

        return $this->autoMapping->map(SupplierEntity::class, SupplierCreateResponse::class, $supplierResult);
    }

    public function update(SupplierUpdateRequest $request)
    {
        $distributorResult = $this->supplierManager->update($request);

        return $this->autoMapping->map(SupplierEntity::class, SupplierGetResponse::class, $distributorResult);
    }

    public function getAllSuppliers()
    {
        $suppliersResponse = [];

        $suppliers = $this->supplierManager->getAllSuppliers();

        foreach ($suppliers as $supplier)
        {
            if($supplier['createdByUserImage'])
            {
                $supplier['createdByUserImage'] = $this->params . $supplier['createdByUserImage'];
            }

            if($supplier['updatedByUserImage'])
            {
                $supplier['updatedByUserImage'] = $this->params . $supplier['updatedByUserImage'];
            }

            $suppliersResponse[] = $this->autoMapping->map('array', SupplierGetResponse::class, $supplier);
        }

        return $suppliersResponse;
    }

    public function deleteSupplierById($request)
    {
        $result = $this->supplierManager->deleteSupplierById($request);

        return $this->autoMapping->map(SupplierEntity::class, SupplierGetResponse::class, $result);
    }

}