<?php

namespace App\Repository;

use App\Entity\CountryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CountryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method CountryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method CountryEntity[]    findAll()
 * @method CountryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CountryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CountryEntity::class);
    }

    // /**
    //  * @return CountryEntity[] Returns an array of CountryEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CountryEntity
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
