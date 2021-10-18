<?php

namespace App\Entity;

use App\Repository\ContainerSpecificationPriceEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ContainerSpecificationPriceEntityRepository::class)
 */
class ContainerSpecificationPriceEntity
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
    private $containerSpecificationID;

    /**
     * @ORM\Column(type="integer")
     */
    private $exportCountryID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $exportCity;

    /**
     * @ORM\Column(type="integer")
     */
    private $destinationPortID;

    /**
     * @ORM\Column(type="float")
     */
    private $price;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="integer")
     */
    private $createdBy;

    /**
     * @Gedmo\Timestampable(on="update")
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

    public function getContainerSpecificationID(): ?int
    {
        return $this->containerSpecificationID;
    }

    public function setContainerSpecificationID(int $containerSpecificationID): self
    {
        $this->containerSpecificationID = $containerSpecificationID;

        return $this;
    }

    public function getExportCountryID(): ?int
    {
        return $this->exportCountryID;
    }

    public function setExportCountryID(int $exportCountryID): self
    {
        $this->exportCountryID = $exportCountryID;

        return $this;
    }

    public function getExportCity(): ?string
    {
        return $this->exportCity;
    }

    public function setExportCity(string $exportCity): self
    {
        $this->exportCity = $exportCity;

        return $this;
    }

    public function getDestinationPortID(): ?int
    {
        return $this->destinationPortID;
    }

    public function setDestinationPortID(int $destinationPortID): self
    {
        $this->destinationPortID = $destinationPortID;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getCreatedBy(): ?int
    {
        return $this->createdBy;
    }

    public function setCreatedBy(int $createdBy): self
    {
        $this->createdBy = $createdBy;

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
