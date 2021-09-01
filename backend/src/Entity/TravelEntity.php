<?php

namespace App\Entity;

use App\Repository\TravelEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=TravelEntityRepository::class)
 */
class TravelEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $type;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $launchCountry;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $destinationCountry;

    /**
     * @ORM\Column(type="datetime")
     */
    private $launchDate;

    /**
     * @ORM\Column(type="datetime")
     */
    private $arrivalDate;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $travelNumber;

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
    private $shipperID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $createdBy;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $updatedBy;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $carrierID;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getLaunchCountry(): ?string
    {
        return $this->launchCountry;
    }

    public function setLaunchCountry(string $launchCountry): self
    {
        $this->launchCountry = $launchCountry;

        return $this;
    }

    public function getDestinationCountry(): ?string
    {
        return $this->destinationCountry;
    }

    public function setDestinationCountry(string $destinationCountry): self
    {
        $this->destinationCountry = $destinationCountry;

        return $this;
    }

    public function getLaunchDate()
    {
        return $this->launchDate;
    }

    public function setLaunchDate($launchDate): self
    {
        $this->launchDate = new \DateTime($launchDate);

        return $this;
    }

    public function getArrivalDate()
    {
        return $this->arrivalDate;
    }

    public function setArrivalDate($arrivalDate): self
    {
        $this->arrivalDate = new \DateTime($arrivalDate);

        return $this;
    }

    public function getTravelNumber(): ?string
    {
        return $this->travelNumber;
    }

    public function setTravelNumber(string $travelNumber): self
    {
        $this->travelNumber = $travelNumber;

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

    public function getShipperID(): ?int
    {
        return $this->shipperID;
    }

    public function setShipperID(int $shipperID): self
    {
        $this->shipperID = $shipperID;

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

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getCarrierID(): ?int
    {
        return $this->carrierID;
    }

    public function setCarrierID(?int $carrierID): self
    {
        $this->carrierID = $carrierID;

        return $this;
    }
}
