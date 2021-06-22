<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AdminProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AdminProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AdminProfileEntity[]    findAll()
 * @method AdminProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AdminProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AdminProfileEntity::class);
    }

    // /**
    //  * @return AdminProfileEntity[] Returns an array of AdminProfileEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AdminProfileEntity
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
