<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProductCategoryEntity;
use App\Manager\ProductCategoryManager;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use App\Response\ProductCategoryCreateResponse;
use App\Response\ProductCategoryGetResponse;

class ProductCategoryService
{
    private $autoMapping;
    private $productCategoryManager;

    public function __construct(AutoMapping $autoMapping, ProductCategoryManager $productCategoryManager)
    {
        $this->autoMapping = $autoMapping;
        $this->productCategoryManager = $productCategoryManager;
    }

    public function create(ProductCategoryCreateRequest $request)
    {
        $productCategoryResult = $this->productCategoryManager->create($request);

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryCreateResponse::class, $productCategoryResult);
    }

    public function update(ProductCategoryUpdateRequest $request)
    {
        $productCategoryResult = $this->productCategoryManager->update($request);

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryGetResponse::class, $productCategoryResult);
    }

    public function getAllProductCategories()
    {
        $productCategoryResponse = [];

        $productCategories = $this->productCategoryManager->getAllProductCategories();

        foreach($productCategories as $productCategory)
        {
            $productCategoryResponse[] = $this->autoMapping->map('array', ProductCategoryGetResponse::class, $productCategory);
        }

        return $productCategoryResponse;
    }

}