<?php

namespace App\Repository;

use App\Entity\OrderShipmentEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\UserProfileEntity;
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
            "userProfile1.image as userImage", "userProfile2.userName as updatedByUser", "userProfile2.image as updatedByUserImage")

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
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.userID = shipmentOrder.updatedBy'
            )

            ->orderBy('shipment.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", 
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
    
}
