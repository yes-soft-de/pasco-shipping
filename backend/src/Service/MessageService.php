<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Manager\MessageManager;
use App\Request\MessageCreateRequest;
use App\Response\MessageCreateResponse;
use App\Response\MessageGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class MessageService
{
    private $autoMapping;
    private $messageManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, MessageManager $messageManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->messageManager = $messageManager;
        $this->params = $params->get('upload_base_url').'/';
    }

    public function chatWithAdministration(MessageCreateRequest $request)
    {
        $request->setRoomID($this->roomID());

        $result = $this->messageManager->chatWithAdministration($request);

        return $this->autoMapping->map(MessageEntity::class, MessageCreateResponse::class, $result);
    }

    // for generate roomID
    public function roomID()
    {
        $data = random_bytes(16);

        $data[0] = chr(ord('a') ); 
        $data[1] = chr(ord('v') ); 
        $data[2] = chr(ord('s') ); 
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

        return  vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

    public function getChatListOfUser($userID)
    {
        $messagesResponse = [];

        $messages = $this->messageManager->getChatListOfUser($userID);

        foreach($messages as $message)
        {
            if($message['image'])
            {
                $message['image'] = $this->params . $message['image'];
            }
            
            $messagesResponse[] = $this->autoMapping->map('array', MessageGetResponse::class, $message);
        }

        return $messagesResponse;
    }

    public function deleteAllMessages()
    {
        return $this->messageManager->deleteAllMessages();
    }

}