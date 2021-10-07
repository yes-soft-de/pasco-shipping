<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\MarkEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubProductCategoryEntity;
use App\Entity\TrackEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\TravelEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TrackEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method TrackEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method TrackEntity[]    findAll()
 * @method TrackEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TrackEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TrackEntity::class);
    }

    public function getByHolderIdAndTrackNumber($holderID, $trackNumber): ?TrackEntity
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.holderType = :holderType')
            ->setParameter('holderType', $holderType)

            ->getQuery()
            ->getResult();
    }

    public function getOneOrNullTrackByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.holderType = :holderType')
            ->setParameter('holderType', $holderType)

            ->getQuery()
            ->getOneOrNullResult();
    }

    // For Get container/air waybill by ID
    public function getTracksByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->createQueryBuilder('track')
            ->select("track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy", "track.amount", 
            "shipmentStatusEntity.shipmentStatus", "shipmentStatusEntity.statusDetails", "shipmentStatusEntity.trackNumber", "shipmentStatusEntity.isInOneHolder", "shipmentStatusEntity.packed", "orderShipmentEntity.volume", 
            "orderShipmentEntity.clientUserID", "orderShipmentEntity.target", "orderShipmentEntity.supplierName", "orderShipmentEntity.supplierID", "orderShipmentEntity.distributorID", "orderShipmentEntity.exportWarehouseID", "orderShipmentEntity.importWarehouseID", 
            "orderShipmentEntity.quantity", "orderShipmentEntity.image", "orderShipmentEntity.createdAt as orderCreationDate", "orderShipmentEntity.isExternalWarehouse", "orderShipmentEntity.updatedAt as orderUpdatingDate", "orderShipmentEntity.subProductCategoryID",
            "orderShipmentEntity.unit", "orderShipmentEntity.receiverName", "orderShipmentEntity.receiverPhoneNumber", "orderShipmentEntity.markID", "orderShipmentEntity.packetingBy", "orderShipmentEntity.externalWarehouseInfo", "orderShipmentEntity.paymentTime",
            "orderShipmentEntity.weight", "orderShipmentEntity.qrCode", "orderShipmentEntity.guniQuantity", "orderShipmentEntity.updatedBy as orderUpdatedByUser", "orderShipmentEntity.vehicleIdentificationNumber", "orderShipmentEntity.extraSpecification",
             "travelEntity.status as travelStatus", "subProductCategory.name as subProductCategoryName", "exportWarehouseEntity.name as exportWarehouseName", "importWarehouseEntity.name as importWarehouseName", "productCategoryEntity.name as productCategoryName",
            "markEntity.markNumber as markNumber")

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.shipmentID = track.shipmentID AND shipmentStatusEntity.trackNumber = track.trackNumber'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = track.shipmentID'
            )

            ->leftJoin(
                TravelEntity::class,
                'travelEntity',
                Join::WITH,
                'travelEntity.id = track.travelID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategory',
                Join::WITH,
                'subProductCategory.id = orderShipmentEntity.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategoryEntity',
                Join::WITH,
                'productCategoryEntity.id = subProductCategory.productCategoryID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = orderShipmentEntity.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouseEntity',
                Join::WITH,
                'importWarehouseEntity.id = orderShipmentEntity.importWarehouseID'
            )

            ->leftJoin(
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = orderShipmentEntity.markID'
            )

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.holderType = :holderType')
            ->setParameter('holderType', $holderType)

            ->getQuery()
            ->getResult();
    }

    public function getByTravelID($travelID)
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.travelID = :travelID')
            ->setParameter('travelID', $travelID)

            ->getQuery()
            ->getResult();
    }

    public function getTracksByTravelID($travelID)
    {
        return $this->createQueryBuilder('track')
            ->select('track.id', 'track.shipmentID', 'track.trackNumber', 'track.travelID', 'track.holderType', 'track.holderID', 'track.createdAt', 'track.updatedAt', 'track.createdBy', 
            'track.updatedBy')

            ->andWhere('track.travelID = :travelID')
            ->setParameter('travelID', $travelID)

            ->orderBy('track.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('track')
            ->select('track.id', 'track.shipmentID', 'track.trackNumber', 'track.travelID', 'track.holderType', 'track.holderID', 'track.createdAt', 'track.updatedAt', 'track.createdBy', 
            'track.updatedBy', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate')

            ->andWhere('track.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                TravelEntity::class,
                'travel',
                Join::WITH,
                'travel.id = track.travelID'
            )

            ->orderBy('track.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function deleteAllTracks()
    {
        return $this->createQueryBuilder('track')
            ->delete()

            ->getQuery()
            ->getResult();
    }
    
}
