<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProductCategoryEntity;
use App\Manager\ProductCategoryManager;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use App\Response\ProductCategoryCreateResponse;
use App\Response\ProductCategoryGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ProductCategoryService
{
    private $autoMapping;
    private $productCategoryManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ProductCategoryManager $productCategoryManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->productCategoryManager = $productCategoryManager;
        $this->params = $params->get('upload_base_url') . '/';
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
            // get related sub product categories
            $productCategory['subProductCategories'] = $this->productCategoryManager->getSubProductCategoriesByProductCategoryID($productCategory['id']);

            if($productCategory['createdByUserImage'])
            {
                $productCategory['createdByUserImage'] = $this->params . $productCategory['createdByUserImage'];
            }

            if($productCategory['updatedByUserImage'])
            {
                $productCategory['updatedByUserImage'] = $this->params . $productCategory['updatedByUserImage'];
            }

            $productCategoryResponse[] = $this->autoMapping->map('array', ProductCategoryGetResponse::class, $productCategory);
        }

        return $productCategoryResponse;
    }

    public function deleteProductCategoryById($request)
    {
        $result = $this->productCategoryManager->deleteProductCategoryById($request);

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryGetResponse::class, $result);
    }

}