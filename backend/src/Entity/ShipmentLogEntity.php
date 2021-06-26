<?php

namespace App\Entity;

use App\Repository\ShipmentLogEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ShipmentLogEntityRepository::class)
 */
class ShipmentLogEntity
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
    private $shipmentStatus;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $trackNumber;

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

    public function getShipmentStatus(): ?string
    {
        return $this->shipmentStatus;
    }

    public function setShipmentStatus(string $shipmentStatus): self
    {
        $this->shipmentStatus = $shipmentStatus;

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

    public function getTrackNumber(): ?string
    {
        return $this->trackNumber;
    }

    public function setTrackNumber(?string $trackNumber): self
    {
        $this->trackNumber = $trackNumber;

        return $this;
    }
}
