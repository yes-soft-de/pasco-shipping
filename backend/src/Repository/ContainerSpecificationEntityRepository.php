<?php

namespace App\Repository;

use App\Entity\ContainerSpecificationEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerSpecificationEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerSpecificationEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerSpecificationEntity[]    findAll()
 * @method ContainerSpecificationEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerSpecificationEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerSpecificationEntity::class);
    }

    // /**
    //  * @return ContainerSpecificationEntity[] Returns an array of ContainerSpecificationEntity objects
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
    public function findOneBySomeField($value): ?ContainerSpecificationEntity
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
