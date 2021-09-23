<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ShipperEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
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

    public function getAllShippers()
    {
        return $this->createQueryBuilder('shipper')
            ->select('shipper.id', 'shipper.name', 'shipper.phone', 'shipper.email', 'shipper.address', 'shipper.createdAt', 'shipper.updatedAt', 'shipper.createdBy', 'shipper.updatedBy',
             'adminProfile.userName as createdByUser', 'adminProfile.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile',
                Join::WITH,
                'adminProfile.userID = shipper.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipper.updatedBy'
            )

            ->orderBy('shipper.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
