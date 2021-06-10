<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\TrackEntity;
use App\Entity\UserProfileEntity;
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
            ->getOneOrNullResult()
        ;
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        return $this->createQueryBuilder('track')
            ->select("track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", 
                "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate", 
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", 
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "shipmentStatus.shipmentStatus", "shipmentStatus.trackNumber", 
                "shipmentStatus.statusDetails", "shipmentStatus.isInOneHolder", "shipmentStatus.packed", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "adminProfile1.userName as trackCreatedByUser", "adminProfile2.userName as trackUpdatedByUser", "userProfile.userName as clientUsername",
                "userProfile.image as clientUserImage", "adminProfile3.userName as orderCreatedByUser", "adminProfile4.userName as shipmentStatusCreatedBy", "adminProfile5.userName as shipmentStatusUpdatedByBy", "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity",
                "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = track.shipmentID'
            )

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatus',
                Join::WITH,
                'shipmentStatus.shipmentID = track.shipmentID AND shipmentStatus.trackNumber = track.trackNumber'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = track.createdBy'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = track.updatedBy'
            )
            
            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = shipmentOrder.clientUserID'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile4',
                Join::WITH,
                'adminProfile4.userID = shipmentStatus.createdBy'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile5',
                Join::WITH,
                'adminProfile5.userID = shipmentStatus.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->getQuery()
            ->getResult();
    }
    
}
