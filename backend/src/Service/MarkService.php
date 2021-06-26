<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\MarkEntity;
use App\Manager\MarkManager;
use App\Request\MarkCreateRequest;
use App\Response\MarkCreateResponse;
use App\Response\MarkGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class MarkService
{
    private $autoMapping;
    private $markManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, MarkManager $markManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->markManager = $markManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(MarkCreateRequest $request)
    {
        $markResult = $this->markManager->create($request);

        if($markResult instanceof MarkEntity)
        {
            return $this->autoMapping->map(MarkEntity::class, MarkCreateResponse::class, $markResult);
        }
        else
        {
            return  $markResult;
        }
    }

    public function getAllMarksByUser($userID)
    {
        $marksResponse = [];

        $marks = $this->markManager->getAllMarksByUser($userID);

        foreach ($marks as $mark)
        {
            $marksResponse[] = $this->autoMapping->map('array', MarkGetResponse::class, $mark);
        }

        return $marksResponse;
    }

    public function deleteMarkById($request)
    {
        $result = $this->markManager->deleteMarkById($request);

        return $this->autoMapping->map(MarkEntity::class, MarkGetResponse::class, $result);
    }

}