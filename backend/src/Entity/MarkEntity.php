<?php

namespace App\Entity;

use App\Repository\MarkEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=MarkEntityRepository::class)
 */
class MarkEntity
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
    private $clientUserID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $markNumber;

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

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClientUserID(): ?int
    {
        return $this->clientUserID;
    }

    public function setClientUserID(int $clientUserID): self
    {
        $this->clientUserID = $clientUserID;

        return $this;
    }

    public function getMarkNumber(): ?string
    {
        return $this->markNumber;
    }

    public function setMarkNumber(string $markNumber): self
    {
        $this->markNumber = $markNumber;

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
}
