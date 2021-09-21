<?php

namespace App\Repository;

use App\Entity\PortsEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PortsEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method PortsEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method PortsEntity[]    findAll()
 * @method PortsEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PortsEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PortsEntity::class);
    }

}
