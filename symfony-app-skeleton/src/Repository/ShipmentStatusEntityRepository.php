<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\UserProfileEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentStatusEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentStatusEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentStatusEntity[]    findAll()
 * @method ShipmentStatusEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentStatusEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentStatusEntity::class);
    }

    public function getUnPackedShipments()
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", 
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", 
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", 
            "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", 
            "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "userProfile1.userName as username", 
            "userProfile1.image as userImage", "adminProfile.userName as updatedByUser", "adminProfile.image as updatedByUserImage", "distributor.fullName as distributorName", "productCategory.name as productCategoryName")

            ->andWhere('shipment.packed = :packed')
            ->setParameter('packed', 0)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile',
                Join::WITH,
                'adminProfile.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", 
            "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", 
            "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "userProfile1.userName as shipmentStatusCreatedByUser", 
            "userProfile2.userName as shipmentStatusUpdatedByUser", "userProfile3.userName as clientUsername", "userProfile3.image as clientUserImage", "userProfile4.userName as orderUpdatedByUser", "userProfile4.image as orderUpdatedByUserImage")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = shipment.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = shipment.updatedBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile3',
                Join::WITH,
                'userProfile3.id = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile4',
                Join::WITH,
                'userProfile4.id = shipmentOrder.updatedBy'
            )

            ->orderBy('shipment.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber): ?ShipmentStatusEntity
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAcceptedShipmentsByUserID($userID)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
                "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile2.userName as shipmentStatusUpdatedByUser", "userProfile1.userName as clientUsername",
                "userProfile1.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity",
                "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipment.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
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

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }
    
}
