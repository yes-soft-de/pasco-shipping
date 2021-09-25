<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\GunnyEntity;
use App\Entity\GunnyShipmentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
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

    public function getSumQuantityByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('gunny_shipment_entity')
            ->select('SUM(gunny_shipment_entity.quantity)')

            ->andWhere('gunny_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getGunnyCountByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('gunny_shipment_entity')
            ->select('COUNT(gunny_shipment_entity.id)')

            ->andWhere('gunny_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('gunny_shipment_entity.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getSingleScalarResult();
    }

    public function getGunnyByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('gunny_shipment_entity')
            ->select('gunny_shipment_entity.id', 'gunny_shipment_entity.gunnyID', 'gunny_shipment_entity.shipmentID', 'gunny_shipment_entity.trackNumber', 'gunny_shipment_entity.quantity', 'gunny_shipment_entity.createdAt',
             'gunny_shipment_entity.createdBy', 'gunny_shipment_entity.updatedAt', 'gunny_shipment_entity.updatedBy', 'gunnyEntity.identificationNumber as gunnyIdentificationNumber', 'adminProfileEntity.userName as createdByUser',
                 'adminProfileEntity.image as createdByUserImage', 'adminProfileEntity2.userName as updatedByUser', 'adminProfileEntity2.image as updatedByUserImage')

            ->andWhere('gunny_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('gunny_shipment_entity.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                GunnyEntity::class,
                'gunnyEntity',
                Join::WITH,
                'gunnyEntity.id = gunny_shipment_entity.gunnyID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity',
                Join::WITH,
                'adminProfileEntity.userID = gunny_shipment_entity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity2',
                Join::WITH,
                'adminProfileEntity2.userID = gunny_shipment_entity.updatedBy'
            )

            ->orderBy('gunny_shipment_entity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
