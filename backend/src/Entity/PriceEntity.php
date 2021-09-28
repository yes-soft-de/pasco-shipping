<?php

namespace App\Entity;

use App\Repository\PriceEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=PriceEntityRepository::class)
 */
class PriceEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="float")
     */
    private $oneKiloPrice;

    /**
     * @ORM\Column(type="float")
     */
    private $oneCBMPrice;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $updatedBy;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOneKiloPrice(): ?float
    {
        return $this->oneKiloPrice;
    }

    public function setOneKiloPrice(float $oneKiloPrice): self
    {
        $this->oneKiloPrice = $oneKiloPrice;

        return $this;
    }

    public function getOneCBMPrice(): ?float
    {
        return $this->oneCBMPrice;
    }

    public function setOneCBMPrice(float $oneCBMPrice): self
    {
        $this->oneCBMPrice = $oneCBMPrice;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getUpdatedBy(): ?int
    {
        return $this->updatedBy;
    }

    public function setUpdatedBy(?int $updatedBy): self
    {
        $this->updatedBy = $updatedBy;

        return $this;
    }
}
