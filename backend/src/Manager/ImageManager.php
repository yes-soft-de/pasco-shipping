<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ImageEntity;
use App\Repository\ImageEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ImageCreateRequest;
use App\Request\ImageUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ImageManager
{
    private $autoMapping;
    private $entityManager;
    private $imageEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ImageEntityRepository $imageEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->imageEntityRepository = $imageEntityRepository;
    }

    public function create(ImageCreateRequest $request)
    {
        $imageEntity = $this->autoMapping->map(ImageCreateRequest::class, ImageEntity::class, $request);

        $this->entityManager->persist($imageEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $imageEntity;
    }

    public function getImagesByShipmentID($shipmentID)
    {
        return $this->imageEntityRepository->getImagesByShipmentID($shipmentID);
    }

    public function deleteImagesByShipmentID($shipmentID)
    {
        $images = $this->imageEntityRepository->getByShipmentID($shipmentID);

        if($images)
        {
            foreach($images as $image)
            {
                $this->entityManager->remove($image);
                $this->entityManager->flush();
            }
        }

        return $images;
    }

}
