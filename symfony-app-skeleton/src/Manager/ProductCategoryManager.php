<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ProductCategoryEntity;
use App\Repository\ProductCategoryEntityRepository;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ProductCategoryManager
{
    private $autoMapping;
    private $entityManager;
    private $productCategoryEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ProductCategoryEntityRepository $productCategoryEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->productCategoryEntityRepository = $productCategoryEntityRepository;
    }

    public function create(ProductCategoryCreateRequest $request)
    {
        $productCategoryEntity = $this->autoMapping->map(ProductCategoryCreateRequest::class, ProductCategoryEntity::class, $request);
        
        $this->entityManager->persist($productCategoryEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $productCategoryEntity;
    }

    public function update(ProductCategoryUpdateRequest $request)
    {
        $productCategoryEntity = $this->productCategoryEntityRepository->find($request->getId());
        
        if(!$productCategoryEntity)
        {
            return  $productCategoryEntity;
        }
        else
        {
            $productCategoryEntity = $this->autoMapping->mapToObject(ProductCategoryUpdateRequest::class, ProductCategoryEntity::class, 
            $request, $productCategoryEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();
            
            return $productCategoryEntity;
        }
    }

    public function getAllProductCategories()
    {
        return $this->productCategoryEntityRepository->getAllProductCategories();
    }

}