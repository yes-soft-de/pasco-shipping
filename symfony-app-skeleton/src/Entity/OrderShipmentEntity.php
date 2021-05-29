<?php

namespace App\Entity;

use App\Repository\OrderShipmentEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=OrderShipmentEntityRepository::class)
 */
class OrderShipmentEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $clientUserID;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $transportationType;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $target;

    /**
     * @ORM\Column(type="integer")
     */
    private $supplierID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $distributorID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $exportWarehouseID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $importWarehouseID;

    /**
     * @ORM\Column(type="integer")
     */
    private $quantity;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

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
     * @ORM\Column(type="integer")
     */
    private $productCategoryID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $unit;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $receiverName;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $receiverPhoneNumber;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $markID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $packetingBy;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $paymentTime;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $weight;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $QRcode;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $guniQuantity;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $updatedBy;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $vehicleIdentificationNumber;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $extraSpecification;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $status;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClientUserID(): ?string
    {
        return $this->clientUserID;
    }

    public function setClientUserID(?string $clientUserID): self
    {
        $this->clientUserID = $clientUserID;

        return $this;
    }

    public function getTransportationType(): ?string
    {
        return $this->transportationType;
    }

    public function setTransportationType(string $transportationType): self
    {
        $this->transportationType = $transportationType;

        return $this;
    }

    public function getTarget(): ?string
    {
        return $this->target;
    }

    public function setTarget(string $target): self
    {
        $this->target = $target;

        return $this;
    }

    public function getSupplierID(): ?int
    {
        return $this->supplierID;
    }

    public function setSupplierID(int $supplierID): self
    {
        $this->supplierID = $supplierID;

        return $this;
    }

    public function getDistributorID(): ?int
    {
        return $this->distributorID;
    }

    public function setDistributorID(int $distributorID): self
    {
        $this->distributorID = $distributorID;

        return $this;
    }

    public function getExportWarehouseID(): ?int
    {
        return $this->exportWarehouseID;
    }

    public function setExportWarehouseID(int $exportWarehouseID): self
    {
        $this->exportWarehouseID = $exportWarehouseID;

        return $this;
    }

    public function getImportWarehouseID(): ?int
    {
        return $this->importWarehouseID;
    }

    public function setImportWarehouseID(?int $importWarehouseID): self
    {
        $this->importWarehouseID = $importWarehouseID;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

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

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getProductCategoryID(): ?int
    {
        return $this->productCategoryID;
    }

    public function setProductCategoryID(int $productCategoryID): self
    {
        $this->productCategoryID = $productCategoryID;

        return $this;
    }

    public function getUnit(): ?string
    {
        return $this->unit;
    }

    public function setUnit(string $unit): self
    {
        $this->unit = $unit;

        return $this;
    }

    public function getReceiverName(): ?string
    {
        return $this->receiverName;
    }

    public function setReceiverName(?string $receiverName): self
    {
        $this->receiverName = $receiverName;

        return $this;
    }

    public function getReceiverPhoneNumber(): ?string
    {
        return $this->receiverPhoneNumber;
    }

    public function setReceiverPhoneNumber(?string $receiverPhoneNumber): self
    {
        $this->receiverPhoneNumber = $receiverPhoneNumber;

        return $this;
    }

    public function getMarkID(): ?int
    {
        return $this->markID;
    }

    public function setMarkID(?int $markID): self
    {
        $this->markID = $markID;

        return $this;
    }

    public function getPacketingBy(): ?int
    {
        return $this->packetingBy;
    }

    public function setPacketingBy(?int $packetingBy): self
    {
        $this->packetingBy = $packetingBy;

        return $this;
    }

    public function getPaymentTime(): ?string
    {
        return $this->paymentTime;
    }

    public function setPaymentTime(string $paymentTime): self
    {
        $this->paymentTime = $paymentTime;

        return $this;
    }

    public function getWeight(): ?float
    {
        return $this->weight;
    }

    public function setWeight(?float $weight): self
    {
        $this->weight = $weight;

        return $this;
    }

    public function getQRcode(): ?string
    {
        return $this->QRcode;
    }

    public function setQRcode(?string $QRcode): self
    {
        $this->QRcode = $QRcode;

        return $this;
    }

    public function getGuniQuantity(): ?int
    {
        return $this->guniQuantity;
    }

    public function setGuniQuantity(?int $guniQuantity): self
    {
        $this->guniQuantity = $guniQuantity;

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

    public function getVehicleIdentificationNumber(): ?string
    {
        return $this->vehicleIdentificationNumber;
    }

    public function setVehicleIdentificationNumber(?string $vehicleIdentificationNumber): self
    {
        $this->vehicleIdentificationNumber = $vehicleIdentificationNumber;

        return $this;
    }

    public function getExtraSpecification(): ?string
    {
        return $this->extraSpecification;
    }

    public function setExtraSpecification(?string $extraSpecification): self
    {
        $this->extraSpecification = $extraSpecification;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }
}
