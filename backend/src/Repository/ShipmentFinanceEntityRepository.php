<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ShipmentFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentFinanceEntity[]    findAll()
 * @method ShipmentFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentFinanceEntity::class);
    }

    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shipmentFinance')
            ->select('shipmentFinance.id', 'shipmentFinance.shipmentID', 'shipmentFinance.trackNumber', 'shipmentFinance.shipmentStatus', 'shipmentFinance.stageCost', 'shipmentFinance.stageDescription',
            'shipmentFinance.currency', 'shipmentFinance.createdAt', 'shipmentFinance.updatedAt', 'shipmentFinance.createdBy', 'shipmentFinance.updatedBy', 'adminProfile1.userName as createdByUser', 
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('shipmentFinance.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentFinance.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentFinance.updatedBy'
            )

            ->orderBy('shipmentFinance.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getCurrentTotalCostByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shipmentFinance')
            ->select('SUM(shipmentFinance.stageCost) as currentTotalCost')

            ->andWhere('shipmentFinance.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentFinance.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getResult();
    }

    public function deleteAllShipmentFinances()
    {
        return $this->createQueryBuilder('shipmentFinance')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
