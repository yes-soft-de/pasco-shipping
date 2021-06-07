<?php

namespace App\Repository;

use App\Entity\SupplierEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SupplierEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SupplierEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SupplierEntity[]    findAll()
 * @method SupplierEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SupplierEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SupplierEntity::class);
    }

    // /**
    //  * @return SupplierEntity[] Returns an array of SupplierEntity objects
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
    public function findOneBySomeField($value): ?SupplierEntity
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
