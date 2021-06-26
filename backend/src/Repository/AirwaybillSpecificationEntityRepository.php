<?php

namespace App\Repository;

use App\Entity\AirwaybillSpecificationEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillSpecificationEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillSpecificationEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillSpecificationEntity[]    findAll()
 * @method AirwaybillSpecificationEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillSpecificationEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillSpecificationEntity::class);
    }

    // /**
    //  * @return AirwaybillSpecificationEntity[] Returns an array of AirwaybillSpecificationEntity objects
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
    public function findOneBySomeField($value): ?AirwaybillSpecificationEntity
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
