<?php

namespace App\Repository;

use App\Entity\OrderShipmentEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method OrderShipmentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderShipmentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderShipmentEntity[]    findAll()
 * @method OrderShipmentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderShipmentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderShipmentEntity::class);
    }

    public function getShipmentsOrdersByStatus($status)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", 
            "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "userProfile1.userName as clientUsername", "userProfile1.image as clientUserImage",
            "userProfile2.userName as orderUpdatedByUser", "userProfile2.image as orderUpdatedByUserImage")

            ->andWhere('shipmentOrder.status = :state')
            ->setParameter('state', $status)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = shipmentOrder.updatedBy'
            )

            ->orderBy('shipmentOrder.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getWitingShipmentsOrdersByTransportationType($transportationType)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", 
            "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "userProfile1.userName as clientUsername", "userProfile1.image as clientUserImage",
            "userProfile2.userName as orderUpdatedByUser", "userProfile2.image as orderUpdatedByUserImage")

            ->andWhere("shipmentOrder.status = 'waiting'")

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = shipmentOrder.updatedBy'
            )

            ->orderBy('shipmentOrder.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

}
