<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\SubProductCategoryEntity;
use App\Repository\SubProductCategoryEntityRepository;
use App\Request\DeleteRequest;
use App\Request\SubProductCategoryCreateRequest;
use App\Request\SubProductCategoryUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class SubProductCategoryManager
{
    private $autoMapping;
    private $entityManager;
    private $subProductCategoryEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, SubProductCategoryEntityRepository $subProductCategoryEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->subProductCategoryEntityRepository = $subProductCategoryEntityRepository;
    }

    public function create(SubProductCategoryCreateRequest $request)
    {
        $subProductCategoryEntity = $this->autoMapping->map(SubProductCategoryCreateRequest::class, SubProductCategoryEntity::class, $request);
        
        $this->entityManager->persist($subProductCategoryEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $subProductCategoryEntity;
    }

    public function update(SubProductCategoryUpdateRequest $request)
    {
        $subProductCategoryEntity = $this->subProductCategoryEntityRepository->find($request->getId());
        
        if(!$subProductCategoryEntity)
        {
            return  $subProductCategoryEntity;
        }
        else
        {
            $subProductCategoryEntity = $this->autoMapping->mapToObject(SubProductCategoryUpdateRequest::class, SubProductCategoryEntity::class, 
            $request, $subProductCategoryEntity);

            $this->entityManager->flush();
            $this->entityManager->clear();
            
            return $subProductCategoryEntity;
        }
    }

    public function getAllSubProductCategories()
    {
        return $this->subProductCategoryEntityRepository->getAllSubProductCategories();
    }

    public function getSubProductCategoriesByProductCategoryID($productCategoryID)
    {
        return $this->subProductCategoryEntityRepository->getSubProductCategoriesByProductCategoryID($productCategoryID);
    }

    public function deleteSubProductCategoryById(DeleteRequest $request)
    {
        $item = $this->subProductCategoryEntityRepository->find($request->getId());

        if(!$item)
        {
            return $item;
        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }

}