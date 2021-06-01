<?php

namespace App\Entity;

use App\Repository\ShipmentStatusEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ShipmentStatusEntityRepository::class)
 */
class ShipmentStatusEntity
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
    private $shipmentID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $trackNumber;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $shipmentStatus;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $statusDetails;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $isInOneHolder;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $packed;

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

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getShipmentID(): ?int
    {
        return $this->shipmentID;
    }

    public function setShipmentID(int $shipmentID): self
    {
        $this->shipmentID = $shipmentID;

        return $this;
    }

    public function getTrackNumber(): ?string
    {
        return $this->trackNumber;
    }

    public function setTrackNumber(string $trackNumber): self
    {
        $this->trackNumber = $trackNumber;

        return $this;
    }

    public function getShipmentStatus(): ?string
    {
        return $this->shipmentStatus;
    }

    public function setShipmentStatus(string $shipmentStatus): self
    {
        $this->shipmentStatus = $shipmentStatus;

        return $this;
    }

    public function getStatusDetails(): ?string
    {
        return $this->statusDetails;
    }

    public function setStatusDetails(?string $statusDetails): self
    {
        $this->statusDetails = $statusDetails;

        return $this;
    }

    public function getIsInOneHolder(): ?bool
    {
        return $this->isInOneHolder;
    }

    public function setIsInOneHolder(bool $isInOneHolder): self
    {
        $this->isInOneHolder = $isInOneHolder;

        return $this;
    }

    public function getPacked(): ?bool
    {
        return $this->packed;
    }

    public function setPacked(bool $packed): self
    {
        $this->packed = $packed;

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
}
