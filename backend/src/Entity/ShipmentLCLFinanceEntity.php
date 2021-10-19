<?php

namespace App\Entity;

use App\Repository\ShipmentLCLFinanceEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ShipmentLCLFinanceEntityRepository::class)
 */
class ShipmentLCLFinanceEntity
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
     * @ORM\Column(type="string", length=50)
     */
    private $trackNumber;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $stageDescription;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $stageCost;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $shipmentStatus;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $currency;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="integer")
     */
    private $createdBy;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $updatedBy;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $holderType;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $holderID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $subcontractID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $importWarehouseID;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $paymentType;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $chequeNumber;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $financialFundName;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $sellingCost;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $buyingCost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $proxyID;

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

    public function getStageDescription(): ?string
    {
        return $this->stageDescription;
    }

    public function setStageDescription(?string $stageDescription): self
    {
        $this->stageDescription = $stageDescription;

        return $this;
    }

    public function getStageCost(): ?float
    {
        return $this->stageCost;
    }

    public function setStageCost(float $stageCost): self
    {
        $this->stageCost = $stageCost;

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

    public function getCurrency(): ?string
    {
        return $this->currency;
    }

    public function setCurrency(?string $currency): self
    {
        $this->currency = $currency;

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

    public function getCreatedBy(): ?int
    {
        return $this->createdBy;
    }

    public function setCreatedBy(int $createdBy): self
    {
        $this->createdBy = $createdBy;

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

    public function getHolderType(): ?string
    {
        return $this->holderType;
    }

    public function setHolderType(?string $holderType): self
    {
        $this->holderType = $holderType;

        return $this;
    }

    public function getHolderID(): ?int
    {
        return $this->holderID;
    }

    public function setHolderID(?int $holderID): self
    {
        $this->holderID = $holderID;

        return $this;
    }

    public function getSubcontractID(): ?int
    {
        return $this->subcontractID;
    }

    public function setSubcontractID(?int $subcontractID): self
    {
        $this->subcontractID = $subcontractID;

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

    public function getPaymentType(): ?string
    {
        return $this->paymentType;
    }

    public function setPaymentType(string $paymentType): self
    {
        $this->paymentType = $paymentType;

        return $this;
    }

    public function getChequeNumber(): ?string
    {
        return $this->chequeNumber;
    }

    public function setChequeNumber(?string $chequeNumber): self
    {
        $this->chequeNumber = $chequeNumber;

        return $this;
    }

    public function getFinancialFundName(): ?string
    {
        return $this->financialFundName;
    }

    public function setFinancialFundName(?string $financialFundName): self
    {
        $this->financialFundName = $financialFundName;

        return $this;
    }

    public function getSellingCost(): ?float
    {
        return $this->sellingCost;
    }

    public function setSellingCost(?float $sellingCost): self
    {
        $this->sellingCost = $sellingCost;

        return $this;
    }

    public function getBuyingCost(): ?float
    {
        return $this->buyingCost;
    }

    public function setBuyingCost(?float $buyingCost): self
    {
        $this->buyingCost = $buyingCost;

        return $this;
    }

    public function getProxyID(): ?int
    {
        return $this->proxyID;
    }

    public function setProxyID(?int $proxyID): self
    {
        $this->proxyID = $proxyID;

        return $this;
    }
}
