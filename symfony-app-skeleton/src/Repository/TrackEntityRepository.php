<?php

namespace App\Repository;

use App\Entity\OrderShipmentEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\TrackEntity;
use App\Entity\UserProfileEntity;
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
            ->select("track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy", 
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", 
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate", "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.productCategoryID", "shipmentOrder.unit", 
                "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", 
                "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "userProfile.userName as username", 
                "userProfile.image as userImage", "shipmentStatus.shipmentStatus", "shipmentStatus.trackNumber", "shipmentStatus.statusDetails", "shipmentStatus.isInOneHolder", "shipmentStatus.packed")

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = track.shipmentID'
            )
            
            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.id = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatus',
                Join::WITH,
                'shipmentStatus.shipmentID = track.shipmentID AND shipmentStatus.trackNumber = track.trackNumber'
            )

            ->getQuery()
            ->getResult();
    }
    
}
