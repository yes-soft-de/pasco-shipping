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
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $updatedBy;

    /**
     * @ORM\Column(type="integer")
     */
    private $exportCountryID;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $exportCity;

    /**
     * @ORM\Column(type="integer")
     */
    private $importCountryID;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $importCity;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="integer")
     */
    private $createdBy;

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

    public function getImportCountryID(): ?int
    {
        return $this->importCountryID;
    }

    public function setImportCountryID(int $importCountryID): self
    {
        $this->importCountryID = $importCountryID;

        return $this;
    }

    public function getImportCity(): ?string
    {
        return $this->importCity;
    }

    public function setImportCity(string $importCity): self
    {
        $this->importCity = $importCity;

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
}
