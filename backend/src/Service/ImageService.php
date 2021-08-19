<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ImageEntity;
use App\Manager\ImageManager;
use App\Request\ImageCreateRequest;
use App\Response\ImageCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ImageService
{
    private $autoMapping;
    private $imageManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ImageManager $imageManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->imageManager = $imageManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(ImageCreateRequest $request)
    {
        $imageResult = $this->imageManager->create($request);

        return $this->autoMapping->map(ImageEntity::class, ImageCreateResponse::class, $imageResult);
    }

}
