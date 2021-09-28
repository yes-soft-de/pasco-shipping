<?php

namespace App\Repository;

use App\Entity\ReceivedShipmentEntity;
use App\Entity\SupplierEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReceivedShipmentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReceivedShipmentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReceivedShipmentEntity[]    findAll()
 * @method ReceivedShipmentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReceivedShipmentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReceivedShipmentEntity::class);
    }

    public function getReceivedShipmentQuantityByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('received_shipment_entity')
            ->select('received_shipment_entity.receivedQuantity')

            ->andWhere('received_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getReceivedShipmentInfoByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('received_shipment_entity')
            ->select('received_shipment_entity.id', 'received_shipment_entity.receivedQuantity', 'received_shipment_entity.supplierID', 'received_shipment_entity.notes', 'received_shipment_entity.createdAt',
             'received_shipment_entity.createdBy', 'received_shipment_entity.shipmentID', 'received_shipment_entity.trackNumber', 'supplierEntity.fullName as supplierName')

            ->andWhere('received_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->leftJoin(
                SupplierEntity::class,
                'supplierEntity',
                Join::WITH,
                'supplierEntity.id = received_shipment_entity.supplierID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

}
