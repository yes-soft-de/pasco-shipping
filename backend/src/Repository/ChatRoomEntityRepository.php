<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ChatRoomEntity;
use App\Entity\ClientProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ChatRoomEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ChatRoomEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ChatRoomEntity[]    findAll()
 * @method ChatRoomEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ChatRoomEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ChatRoomEntity::class);
    }

    public function getChatByUser($userOneID)
    {
        return $this->createQueryBuilder('chat')
            ->select('chat.id', 'chat.userOneID', 'chat.title', 'chat.description', 'chat.roomID', 'chat.createdAt', 'chat.state', 'chat.updatedAt')

            ->andWhere('chat.userOneID = :userOneID')
            ->setParameter('userOneID', $userOneID)

            ->getQuery()
            ->getResult();
    }

    public function getChatByRoomID($roomID)
    {
        return $this->createQueryBuilder('chat')
            ->select('chat.id', 'chat.userOneID', 'chat.title', 'chat.description', 'chat.roomID', 'chat.createdAt')

            ->andWhere('chat.roomID = :roomID')
            ->setParameter('roomID', $roomID)

            ->getQuery()
            ->getResult();
    }

    public function filterChats($userID)
    {
        $query = $this->createQueryBuilder('chat')
            ->select('chat.id', 'chat.userOneID', 'chat.title', 'chat.description', 'chat.roomID', 'chat.createdAt', 'chat.state', 'clientProfileEntity.userName as clientUsername',
             'clientProfileEntity.image as clientUserImage', 'chat.updatedBy', 'chat.updatedAt', 'adminProfileEntity.userName as updatedByUser', 'adminProfileEntity.image as updatedByUserImage')

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = chat.userOneID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity',
                Join::WITH,
                'adminProfileEntity.userID = chat.updatedBy'
            )

            ->orderBy('chat.id', 'DESC');

        if($userID)
        {
            $query->andWhere('chat.userOneID = :userID');
            $query->setParameter('userID', $userID);
        }

        return $query->getQuery()->getResult();
    }

    public function deleteAllChats()
    {
        return $this->createQueryBuilder('chat')
            ->delete()
            ->getQuery()
            ->getResult();
    }

}