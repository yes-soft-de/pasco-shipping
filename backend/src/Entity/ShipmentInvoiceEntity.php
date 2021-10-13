<?php

namespace App\Entity;

use App\Repository\ShipmentInvoiceEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=ShipmentInvoiceEntityRepository::class)
 */
class ShipmentInvoiceEntity
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

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $paymentStatus;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $paymentDate;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $paidBy;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $paidOnBehalfBy;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $invoiceImage;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $receiptImage;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $totalCost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $discount;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $notes;

    /**
     * @ORM\Column(type="object", nullable=true)
     */
    private $billDetails;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $finalAmount;

    /**
     * @ORM\Column(type="object", nullable=true)
     */
    private $buyingDetails;

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

    public function getPaymentStatus(): ?string
    {
        return $this->paymentStatus;
    }

    public function setPaymentStatus(string $paymentStatus): self
    {
        $this->paymentStatus = $paymentStatus;

        return $this;
    }

    public function getPaymentDate()
    {
        return $this->paymentDate;
    }

    public function setPaymentDate($paymentDate): self
    {
        $this->paymentDate = new \DateTime($paymentDate);

        return $this;
    }

    public function getPaidBy(): ?int
    {
        return $this->paidBy;
    }

    public function setPaidBy(?int $paidBy): self
    {
        $this->paidBy = $paidBy;

        return $this;
    }

    public function getPaidOnBehalfBy(): ?string
    {
        return $this->paidOnBehalfBy;
    }

    public function setPaidOnBehalfBy(?string $paidOnBehalfBy): self
    {
        $this->paidOnBehalfBy = $paidOnBehalfBy;

        return $this;
    }

    public function getInvoiceImage(): ?string
    {
        return $this->invoiceImage;
    }

    public function setInvoiceImage(?string $invoiceImage): self
    {
        $this->invoiceImage = $invoiceImage;

        return $this;
    }

    public function getReceiptImage(): ?string
    {
        return $this->receiptImage;
    }

    public function setReceiptImage(?string $receiptImage): self
    {
        $this->receiptImage = $receiptImage;

        return $this;
    }

    public function getTotalCost(): ?float
    {
        return $this->totalCost;
    }

    public function setTotalCost(?float $totalCost): self
    {
        $this->totalCost = $totalCost;

        return $this;
    }

    public function getDiscount(): ?int
    {
        return $this->discount;
    }

    public function setDiscount(?int $discount): self
    {
        $this->discount = $discount;

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

    public function getBillDetails()
    {
        return $this->billDetails;
    }

    public function setBillDetails($billDetails): self
    {
        $this->billDetails = $billDetails;

        return $this;
    }

    public function getFinalAmount(): ?float
    {
        return $this->finalAmount;
    }

    public function setFinalAmount(?float $finalAmount): self
    {
        $this->finalAmount = $finalAmount;

        return $this;
    }

    public function getBuyingDetails()
    {
        return $this->buyingDetails;
    }

    public function setBuyingDetails($buyingDetails): self
    {
        $this->buyingDetails = $buyingDetails;

        return $this;
    }
}
