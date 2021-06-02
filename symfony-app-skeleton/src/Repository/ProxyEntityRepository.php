<?php

namespace App\Repository;

use App\Entity\ProxyEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ProxyEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProxyEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProxyEntity[]    findAll()
 * @method ProxyEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProxyEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProxyEntity::class);
    }

    // /**
    //  * @return ProxyEntity[] Returns an array of ProxyEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ProxyEntity
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
