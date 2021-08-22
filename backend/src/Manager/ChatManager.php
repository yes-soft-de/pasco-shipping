<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ChatRoomEntity;
use App\Repository\ChatRoomEntityRepository;
use App\Request\ChatCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ChatManager
{
    private $autoMapping;
    private $entityManager;
    private $chatRoomEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ChatRoomEntityRepository $chatRoomEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->chatRoomEntityRepository = $chatRoomEntityRepository;
    }

    public function chatWithAdministration(ChatCreateRequest $request)
    {
        $chatEntity = $this->chatRoomEntityRepository->getChatByUser($request->getUserOneID());

        if($chatEntity)
        {
            return $chatEntity;
        }

        else
        {
            $chatEntity = $this->autoMapping->map(ChatCreateRequest::class, ChatRoomEntity::class, $request);

            $this->entityManager->persist($chatEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $chatEntity;
        }
    }

    public function getChatByUser($userID)
    {
        return $this->chatRoomEntityRepository->getChatByUser($userID);
    }

    public function deleteAllChats()
    {
        return $this->chatRoomEntityRepository->deleteAllChats();
    }
    
}