<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ShipmentLogEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentLogEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentLogEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentLogEntity[]    findAll()
 * @method ShipmentLogEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentLogEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentLogEntity::class);
    }

    public function getAllShipmentsLogs()
    {
        return $this->createQueryBuilder('shipmentLog')
            ->select('shipmentLog.id', 'shipmentLog.shipmentID', 'shipmentLog.shipmentStatus', 'shipmentLog.createdAt')

            ->orderBy('shipmentLog.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAllShipmentLogsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentLog')
            ->select('shipmentLog.id', 'shipmentLog.shipmentID', 'shipmentLog.trackNumber', 'shipmentLog.shipmentStatus', 'shipmentLog.createdAt')

            ->andWhere('shipmentLog.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->orderBy('shipmentLog.id', 'ASC')

            ->getQuery()
            ->getResult();
    }

    public function getAllShipmentLogsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shipmentLog')
            ->select('shipmentLog.id', 'shipmentLog.shipmentID', 'shipmentLog.trackNumber', 'shipmentLog.shipmentStatus', 'shipmentLog.createdAt', 'shipmentLog.createdBy', 'adminProfile.userName as createdByUser', 
            'adminProfile.image as createdByUserImage')

            ->andWhere('shipmentLog.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentLog.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile',
                Join::WITH,
                'adminProfile.userID = shipmentLog.createdBy'
            )

            ->orderBy('shipmentLog.id', 'ASC')

            ->getQuery()
            ->getResult();
    }

    public function deleteAllShipmentsLogs()
    {
        return $this->createQueryBuilder('shipmentLog')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
