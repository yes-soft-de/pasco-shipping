<?php

namespace App\Repository;

use App\Entity\GunnyShipmentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method GunnyShipmentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method GunnyShipmentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method GunnyShipmentEntity[]    findAll()
 * @method GunnyShipmentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GunnyShipmentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GunnyShipmentEntity::class);
    }

}
