<?php

namespace App\Entity;

use App\Repository\MessageEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=MessageEntityRepository::class)
 */
class MessageEntity
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
    private $userOneID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $userTwoID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $roomID;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUserOne(): ?int
    {
        return $this->userOneID;
    }

    public function setUserOne(int $userOneID): self
    {
        $this->userOneID = $userOneID;

        return $this;
    }

    public function getUserTwoID(): ?int
    {
        return $this->userTwoID;
    }

    public function setUserTwoID(int $userTwoID): self
    {
        $this->userTwoID = $userTwoID;

        return $this;
    }

    public function getRoomID(): ?string
    {
        return $this->roomID;
    }

    public function setRoomID(string $roomID): self
    {
        $this->roomID = $roomID;

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
}
