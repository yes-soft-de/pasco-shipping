<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Repository\MessageEntityRepository;
use App\Request\MessageCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class MessageManager
{
    private $autoMapping;
    private $messageEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, MessageEntityRepository $messageEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->messageEntityRepository = $messageEntityRepository;
    }

    public function chatWithAdministration(MessageCreateRequest $request)
    {
        $messageEntity = $this->messageEntityRepository->getMessageByUser($request->getUserOneID());

        if($messageEntity)
        {
            return $messageEntity;
        }

        else
        {
            $messageEntity = $this->autoMapping->map(MessageCreateRequest::class, MessageEntity::class, $request);

            $this->entityManager->persist($messageEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $messageEntity;
        }
    }

    public function getChatListOfUser($userID)
    {
        return $this->messageEntityRepository->getSentMessagesList($userID);
    }

    public function deleteAllMessages()
    {
        return $this->messageEntityRepository->deleteAllMessages();
    }
    
}