<?php

namespace App\Repository;

use App\Entity\AirwaybillFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillFinanceEntity[]    findAll()
 * @method AirwaybillFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillFinanceEntity::class);
    }

}
