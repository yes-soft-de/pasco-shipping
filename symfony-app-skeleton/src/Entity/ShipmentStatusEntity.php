<?php

namespace App\Entity;

use App\Repository\ShipmentStatusEntityRepository;
use Doctrine\ORM\Mapping as ORM;

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
     * @ORM\Column(type="boolean")
     */
    private $isInOneHolder;

    /**
     * @ORM\Column(type="boolean")
     */
    private $packed;

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
}
