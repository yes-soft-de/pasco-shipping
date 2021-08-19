<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ChatRoomEntity;
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
            ->select('chat.id', 'chat.userOneID', 'chat.roomID', 'chat.createdAt')

            ->andWhere('chat.userOneID = :userOneID')
            ->setParameter('userOneID', $userOneID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function deleteAllChats()
    {
        return $this->createQueryBuilder('chat')
            ->delete()
            ->getQuery()
            ->getResult();
    }

}
