<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\SubProductCategoryEntity;
use App\Manager\SubProductCategoryManager;
use App\Request\SubProductCategoryCreateRequest;
use App\Request\SubProductCategoryUpdateRequest;
use App\Response\SubProductCategoryCreateResponse;
use App\Response\SubProductCategoryGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class SubProductCategoryService
{
    private $autoMapping;
    private $subProductCategoryManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, SubProductCategoryManager $subProductCategoryManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->subProductCategoryManager = $subProductCategoryManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(SubProductCategoryCreateRequest $request)
    {
        $subProductCategoryResult = $this->subProductCategoryManager->create($request);

        return $this->autoMapping->map(SubProductCategoryEntity::class, SubProductCategoryCreateResponse::class, $subProductCategoryResult);
    }

    public function update(SubProductCategoryUpdateRequest $request)
    {
        $subProductCategoryResult = $this->subProductCategoryManager->update($request);

        return $this->autoMapping->map(SubProductCategoryEntity::class, SubProductCategoryGetResponse::class, $subProductCategoryResult);
    }

    public function getAllSubProductCategories()
    {
        $subProductCategoryResponse = [];

        $subProductCategories = $this->subProductCategoryManager->getAllSubProductCategories();

        foreach($subProductCategories as $subProductCategory)
        {
            if($subProductCategory['createdByUserImage'])
            {
                $subProductCategory['createdByUserImage'] = $this->params . $subProductCategory['createdByUserImage'];
            }

            if($subProductCategory['updatedByUserImage'])
            {
                $subProductCategory['updatedByUserImage'] = $this->params . $subProductCategory['updatedByUserImage'];
            }

            $subProductCategoryResponse[] = $this->autoMapping->map('array', SubProductCategoryGetResponse::class, $subProductCategory);
        }

        return $subProductCategoryResponse;
    }

    public function deleteSubProductCategoryById($request)
    {
        $result = $this->subProductCategoryManager->deleteSubProductCategoryById($request);

        return $this->autoMapping->map(SubProductCategoryEntity::class, SubProductCategoryGetResponse::class, $result);
    }

}