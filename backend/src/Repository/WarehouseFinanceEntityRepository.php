<?php

namespace App\Repository;

use App\Entity\WarehouseFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method WarehouseFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method WarehouseFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method WarehouseFinanceEntity[]    findAll()
 * @method WarehouseFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class WarehouseFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, WarehouseFinanceEntity::class);
    }

}
