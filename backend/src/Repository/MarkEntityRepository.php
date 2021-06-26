<?php

namespace App\Repository;

use App\Entity\MarkEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MarkEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method MarkEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method MarkEntity[]    findAll()
 * @method MarkEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MarkEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MarkEntity::class);
    }

    public function getAllMarksByUser($userID)
    {
        return $this->createQueryBuilder('mark')
            ->select('mark.id', 'mark.clientUserID', 'mark.markNumber', 'mark.createdAt', 'mark.updatedAt')

            ->andWhere('mark.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->orderBy('mark.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
