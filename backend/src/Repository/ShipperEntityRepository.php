<?php

namespace App\Repository;

use App\Entity\ShipperEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipperEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipperEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipperEntity[]    findAll()
 * @method ShipperEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipperEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipperEntity::class);
    }

}
