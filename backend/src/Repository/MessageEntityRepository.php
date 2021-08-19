<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\MessageEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MessageEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method MessageEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method MessageEntity[]    findAll()
 * @method MessageEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MessageEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MessageEntity::class);
    }

    public function getMessageByUser($userOneID)
    {
        return $this->createQueryBuilder('message')
            ->select('message.id', 'message.userOneID', 'message.userTwoID', 'message.roomID', 'message.createdAt')

            ->andWhere('message.userOneID = :userOneID')
            ->setParameter('userOneID', $userOneID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getSentMessagesList($userID)
    {
        return $this->createQueryBuilder('message')
            ->select('message.id', 'message.userOneID', 'message.userTwoID', 'message.roomID', 'message.createdAt', 'adminProfileEntity.userName as username', 'adminProfileEntity.image')

            ->andWhere('message.userOneID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity',
                Join::WITH,
                'adminProfileEntity.userID = message.userTwoID'
            )

            ->getQuery()
            ->getResult();
    }

    public function deleteAllMessages()
    {
        return $this->createQueryBuilder('message')
            ->delete()
            ->getQuery()
            ->getResult();
    }

}
