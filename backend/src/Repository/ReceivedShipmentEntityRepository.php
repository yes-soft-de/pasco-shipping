<?php

namespace App\Repository;

use App\Entity\ReceivedShipmentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
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

    public function getReceivedShipmentQuantityByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('received_shipment_entity')
            ->select('received_shipment_entity.receivedQuantity')

            ->andWhere('received_shipment_entity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('received_shipment_entity.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

}
