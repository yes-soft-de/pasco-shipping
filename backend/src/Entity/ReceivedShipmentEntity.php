<?php

namespace App\Entity;

use App\Repository\ReceivedShipmentEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ReceivedShipmentEntityRepository::class)
 */
class ReceivedShipmentEntity
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
     * @ORM\Column(type="integer", nullable=true)
     */
    private $receivedQuantity;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $supplierID;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $notes;

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

    public function getReceivedQuantity(): ?int
    {
        return $this->receivedQuantity;
    }

    public function setReceivedQuantity(?int $receivedQuantity): self
    {
        $this->receivedQuantity = $receivedQuantity;

        return $this;
    }

    public function getSupplierID(): ?int
    {
        return $this->supplierID;
    }

    public function setSupplierID(?int $supplierID): self
    {
        $this->supplierID = $supplierID;

        return $this;
    }

    public function getNotes(): ?string
    {
        return $this->notes;
    }

    public function setNotes(?string $notes): self
    {
        $this->notes = $notes;

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
