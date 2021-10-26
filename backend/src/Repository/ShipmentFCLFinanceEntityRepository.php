<?php

namespace App\Repository;

use App\Constant\ShipmentFCLFinancialStatusConstant;
use App\Entity\AdminProfileEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProxyEntity;
use App\Entity\ShipmentFCLFinanceEntity;
use App\Entity\SubcontractEntity;
use App\Entity\TrackEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentFCLFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentFCLFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentFCLFinanceEntity[]    findAll()
 * @method ShipmentFCLFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentFCLFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentFCLFinanceEntity::class);
    }

    public function getShipmentFCLTotalCostByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentFCLFinance')
            ->select('SUM(shipmentFCLFinance.stageCost) as currentTotalCost')

            ->andWhere('shipmentFCLFinance.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getSingleScalarResult();
    }

    public function getShipmentFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentFCLFinance')
            ->select('shipmentFCLFinance.shipmentStatus', 'shipmentFCLFinance.stageCost', 'shipmentFCLFinance.stageDescription')

            ->andWhere('shipmentFCLFinance.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentFCLFinance.shipmentStatus IN (:shipmentStatus)')
            ->setParameter('shipmentStatus', ShipmentFCLFinancialStatusConstant::$FCL_SHIPMENT_BILL_DETAILS)

            ->getQuery()
            ->getResult();
    }

    public function filterShipmentFCLFinances($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID)
    {
        $query = $this->createQueryBuilder('shipmentFCLFinance')
            ->select('shipmentFCLFinance.id', 'shipmentFCLFinance.shipmentID', 'shipmentFCLFinance.trackNumber', 'shipmentFCLFinance.shipmentStatus', 'shipmentFCLFinance.stageCost', 'shipmentFCLFinance.stageDescription', 'shipmentFCLFinance.currency', 'shipmentFCLFinance.createdAt',
                'shipmentFCLFinance.updatedAt', 'shipmentFCLFinance.createdBy', 'shipmentFCLFinance.importWarehouseID', 'shipmentFCLFinance.subcontractID', 'shipmentFCLFinance.paymentType', 'shipmentFCLFinance.proxyID', 'shipmentFCLFinance.chequeNumber', 'shipmentFCLFinance.updatedBy',
                'orderShipmentEntity.volume', 'orderShipmentEntity.weight', 'orderShipmentEntity.transportationType', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
                'warehouseEntity.name as importWarehouseName', 'subcontractEntity.fullName as subcontractName', 'proxyEntity.fullName as proxyName')

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = shipmentFCLFinance.shipmentID'
            )

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentFCLFinance.shipmentID AND trackEntity.trackNumber = shipmentFCLFinance.trackNumber'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentFCLFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentFCLFinance.updatedBy'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'warehouseEntity',
                Join::WITH,
                'warehouseEntity.id = shipmentFCLFinance.importWarehouseID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = shipmentFCLFinance.subcontractID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxyEntity',
                Join::WITH,
                'proxyEntity.id = shipmentFCLFinance.proxyID'
            )

            ->orderBy('shipmentFCLFinance.id', 'DESC');

        if($shipmentID)
        {
            $query->andWhere('shipmentFCLFinance.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($trackNumber)
        {
            $query->andWhere('shipmentFCLFinance.trackNumber = :trackNumber');
            $query->setParameter('trackNumber', $trackNumber);
        }

        if($shipmentStatus)
        {
            $query->andWhere('shipmentFCLFinance.shipmentStatus = :shipmentStatus');
            $query->setParameter('shipmentStatus', $shipmentStatus);
        }

        if($exportWarehouseID)
        {
            $query->andWhere('orderShipmentEntity.exportWarehouseID = :exportWarehouseID');
            $query->setParameter('exportWarehouseID', $exportWarehouseID);
        }

        if($importWarehouseID)
        {
            $query->andWhere('orderShipmentEntity.importWarehouseID = :importWarehouseID');
            $query->setParameter('importWarehouseID', $importWarehouseID);
        }

        return $query->getQuery()->getResult();
    }

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID)
    {
        $query = $this->createQueryBuilder('shipmentFCLFinance')
            ->select('SUM(shipmentFCLFinance.stageCost) as currentTotalCost')

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentFCLFinance.shipmentID AND trackEntity.trackNumber = shipmentFCLFinance.trackNumber'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = shipmentFCLFinance.shipmentID'
            );

        if($shipmentID)
        {
            $query->andWhere('shipmentFCLFinance.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($trackNumber)
        {
            $query->andWhere('shipmentFCLFinance.trackNumber = :trackNumber');
            $query->setParameter('trackNumber', $trackNumber);
        }

        if($shipmentStatus)
        {
            $query->andWhere('shipmentFCLFinance.shipmentStatus = :shipmentStatus');
            $query->setParameter('shipmentStatus', $shipmentStatus);
        }

        if($exportWarehouseID)
        {
            $query->andWhere('orderShipmentEntity.exportWarehouseID = :exportWarehouseID');
            $query->setParameter('exportWarehouseID', $exportWarehouseID);
        }

        if($importWarehouseID)
        {
            $query->andWhere('orderShipmentEntity.importWarehouseID = :importWarehouseID');
            $query->setParameter('importWarehouseID', $importWarehouseID);
        }

        return $query->getQuery()->getOneOrNullResult();
    }

    public function deleteAllShipmentFCLFinances()
    {
        return $this->createQueryBuilder('shipmentFCLFinance')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
