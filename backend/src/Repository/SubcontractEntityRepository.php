<?php

namespace App\Repository;

use App\Entity\SubcontractEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SubcontractEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SubcontractEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SubcontractEntity[]    findAll()
 * @method SubcontractEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SubcontractEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SubcontractEntity::class);
    }

    // /**
    //  * @return SubcontractEntity[] Returns an array of SubcontractEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SubcontractEntity
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
