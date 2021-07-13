<?php

namespace App\Entity;

use App\Repository\ContainerEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ContainerEntityRepository::class)
 */
class ContainerEntity
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
    private $containerNumber;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $status;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $createdBy;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $updatedBy;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $type;

    /**
     * @ORM\Column(type="integer")
     */
    private $providedBy;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $shipperID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $consigneeID;

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

    public function getContainerNumber(): ?string
    {
        return $this->containerNumber;
    }

    public function setContainerNumber(?string $containerNumber): self
    {
        $this->containerNumber = $containerNumber;

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

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getCreatedBy(): ?string
    {
        return $this->createdBy;
    }

    public function setCreatedBy(string $createdBy): self
    {
        $this->createdBy = $createdBy;

        return $this;
    }

    public function getUpdatedBy(): ?string
    {
        return $this->updatedBy;
    }

    public function setUpdatedBy(?string $updatedBy): self
    {
        $this->updatedBy = $updatedBy;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getProvidedBy(): ?int
    {
        return $this->providedBy;
    }

    public function setProvidedBy(int $providedBy): self
    {
        $this->providedBy = $providedBy;

        return $this;
    }

    public function getShipperID(): ?int
    {
        return $this->shipperID;
    }

    public function setShipperID(?int $shipperID): self
    {
        $this->shipperID = $shipperID;

        return $this;
    }

    public function getConsigneeID(): ?int
    {
        return $this->consigneeID;
    }

    public function setConsigneeID(?int $consigneeID): self
    {
        $this->consigneeID = $consigneeID;

        return $this;
    }
}
