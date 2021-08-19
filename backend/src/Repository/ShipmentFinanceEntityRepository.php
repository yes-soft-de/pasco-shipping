<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ShipmentFinanceEntity;
use App\Entity\TrackEntity;
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

    public function getCurrentTotalCostByFilterOptions($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID, $containerID, $airwaybillID, $travelID)
    {
        $query = $this->createQueryBuilder('shipmentFinance')
            ->select('SUM(shipmentFinance.stageCost) as currentTotalCost')

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentFinance.shipmentID AND trackEntity.trackNumber = shipmentFinance.trackNumber'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = shipmentFinance.shipmentID'
            );

        if($shipmentID)
        {
            $query->andWhere('shipmentFinance.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($trackNumber)
        {
            $query->andWhere('shipmentFinance.trackNumber = :trackNumber');
            $query->setParameter('trackNumber', $trackNumber);
        }

        if($shipmentStatus)
        {
            $query->andWhere('shipmentFinance.shipmentStatus = :shipmentStatus');
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

        if($containerID != null && $airwaybillID == null)
        {
            $query->andWhere("trackEntity.holderType = 'container'");
            $query->andWhere('trackEntity.holderID = :containerID');
            $query->setParameter('containerID', $containerID);
        }

        if($containerID == null && $airwaybillID != null)
        {
            $query->andWhere("trackEntity.holderType = 'airwaybill'");
            $query->andWhere('trackEntity.holderID = :airwaybillID');
            $query->setParameter('airwaybillID', $airwaybillID);
        }

        if($travelID)
        {
            $query->andWhere('trackEntity.travelID = :travelID');
            $query->setParameter('travelID', $travelID);
        }

        return $query->getQuery()->getOneOrNullResult();
    }

    public function filterShipmentFinances($shipmentID, $trackNumber, $shipmentStatus, $exportWarehouseID, $importWarehouseID, $containerID, $airwaybillID, $travelID)
    {
        $query = $this->createQueryBuilder('shipmentFinance')
            ->select('shipmentFinance.id', 'shipmentFinance.shipmentID', 'shipmentFinance.trackNumber', 'shipmentFinance.shipmentStatus', 'shipmentFinance.stageCost', 'shipmentFinance.stageDescription',
            'shipmentFinance.currency', 'shipmentFinance.createdAt', 'shipmentFinance.updatedAt', 'shipmentFinance.createdBy', 'shipmentFinance.updatedBy', 
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = shipmentFinance.shipmentID'
            )

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentFinance.shipmentID AND trackEntity.trackNumber = shipmentFinance.trackNumber'
            )

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

            ->orderBy('shipmentFinance.id', 'DESC');

        if($shipmentID)
        {
            $query->andWhere('shipmentFinance.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($trackNumber)
        {
            $query->andWhere('shipmentFinance.trackNumber = :trackNumber');
            $query->setParameter('trackNumber', $trackNumber);
        }

        if($shipmentStatus)
        {
            $query->andWhere('shipmentFinance.shipmentStatus = :shipmentStatus');
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

        if($containerID != null && $airwaybillID == null)
        {
            $query->andWhere("trackEntity.holderType = 'container'");
            $query->andWhere('trackEntity.holderID = :containerID');
            $query->setParameter('containerID', $containerID);
        }

        if($containerID == null && $airwaybillID != null)
        {
            $query->andWhere("trackEntity.holderType = 'airwaybill'");
            $query->andWhere('trackEntity.holderID = :airwaybillID');
            $query->setParameter('airwaybillID', $airwaybillID);
        }

        if($travelID)
        {
            $query->andWhere('trackEntity.travelID = :travelID');
            $query->setParameter('travelID', $travelID);
        }

        return $query->getQuery()->getResult();
    }

    public function deleteAllShipmentFinances()
    {
        return $this->createQueryBuilder('shipmentFinance')
            ->delete()

            ->getQuery()
            ->getResult();
    }

    // For distribute holder cost functions
    public function getByShipmentIdAndTrackNumberAndHolderTypeAndHolderIdAndStatus($shipmentID, $trackNumber, $holderType, $holderID, $shipmentStatus)
    {
        return $this->createQueryBuilder('shipmentFinance')
            ->select('shipmentFinance.id', 'shipmentFinance.shipmentID', 'shipmentFinance.trackNumber', 'shipmentFinance.shipmentStatus', 'shipmentFinance.stageCost', 'shipmentFinance.stageDescription',
            'shipmentFinance.currency', 'shipmentFinance.holderType', 'shipmentFinance.holderID', 'shipmentFinance.createdAt', 'shipmentFinance.updatedAt', 'shipmentFinance.createdBy', 'shipmentFinance.updatedBy', 'adminProfile1.userName as createdByUser', 
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('shipmentFinance.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentFinance.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->andWhere('shipmentFinance.holderType = :holderType')
            ->setParameter('holderType', $holderType)

            ->andWhere('shipmentFinance.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('shipmentFinance.shipmentStatus = :shipmentStatus')
            ->setParameter('shipmentStatus', $shipmentStatus)

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

}
