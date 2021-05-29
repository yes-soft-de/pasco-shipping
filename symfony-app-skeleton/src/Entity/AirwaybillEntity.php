<?php

namespace App\Entity;

use App\Repository\AirwaybillEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=AirwaybillEntityRepository::class)
 */
class AirwaybillEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $specificationID;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $airwaybillNumber;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $status;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSpecificationID(): ?int
    {
        return $this->specificationID;
    }

    public function setSpecificationID(int $specificationID): self
    {
        $this->specificationID = $specificationID;

        return $this;
    }

    public function getAirwaybillNumber(): ?string
    {
        return $this->airwaybillNumber;
    }

    public function setAirwaybillNumber(?string $airwaybillNumber): self
    {
        $this->airwaybillNumber = $airwaybillNumber;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): self
    {
        $this->status = $status;

        return $this;
    }
}
