<?php

namespace App\Repository;

use App\Entity\ShiftingShipmentOrderEntity;
use App\Entity\ShipmentInvoiceEntity;
use App\Entity\WarehouseEntity;
use App\Request\ShiftingShipmentOrderFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShiftingShipmentOrderEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShiftingShipmentOrderEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShiftingShipmentOrderEntity[]    findAll()
 * @method ShiftingShipmentOrderEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShiftingShipmentOrderEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShiftingShipmentOrderEntity::class);
    }

    public function filterShiftingShipmentOrders(ShiftingShipmentOrderFilterRequest $request)
    {
        $query = $this->createQueryBuilder('shiftingShipmentOrderEntity')
            ->select('shiftingShipmentOrderEntity.id', 'shiftingShipmentOrderEntity.shipmentID', 'shiftingShipmentOrderEntity.trackNumber', 'shiftingShipmentOrderEntity.fromImportWarehouseID', 'shiftingShipmentOrderEntity.toImportWarehouseID',
            'shiftingShipmentOrderEntity.status', 'shiftingShipmentOrderEntity.notes', 'shiftingShipmentOrderEntity.createdAt', 'shiftingShipmentOrderEntity.createdBy', 'shiftingShipmentOrderEntity.updatedAt', 'shiftingShipmentOrderEntity.updatedBy',
             'fromImportWarehouseEntity.name as fromImportWarehouseName', 'fromImportWarehouseEntity.city as fromImportWarehouseCity', 'toImportWarehouseEntity.name as toImportWarehouseName', 'toImportWarehouseEntity.city as toImportWarehouseCity',
             'shipmentInvoiceEntity.paymentStatus')

            ->leftJoin(
                WarehouseEntity::class,
                'fromImportWarehouseEntity',
                Join::WITH,
                'fromImportWarehouseEntity.id = shiftingShipmentOrderEntity.fromImportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'toImportWarehouseEntity',
                Join::WITH,
                'toImportWarehouseEntity.id = shiftingShipmentOrderEntity.toImportWarehouseID'
            )

            ->leftJoin(
                ShipmentInvoiceEntity::class,
                'shipmentInvoiceEntity',
                Join::WITH,
                'shipmentInvoiceEntity.shipmentID = shiftingShipmentOrderEntity.shipmentID'
            )

            ->orderBy('shiftingShipmentOrderEntity.id', 'DESC');

        if($request->getFromImportWarehouseID())
        {
            $query->andWhere('shiftingShipmentOrderEntity.fromImportWarehouseID = :fromImportWarehouseID');
            $query->setParameter('fromImportWarehouseID', $request->getFromImportWarehouseID());
        }

        if($request->getToImportWarehouseID())
        {
            $query->andWhere('shiftingShipmentOrderEntity.toImportWarehouseID = :toImportWarehouseID');
            $query->setParameter('toImportWarehouseID', $request->getToImportWarehouseID());
        }

        if($request->getStatus())
        {
            $query->andWhere('shiftingShipmentOrderEntity.status = :status');
            $query->setParameter('status', $request->getStatus());
        }

        return $query->getQuery()->getResult();
    }

    public function getShiftingShipmentOrderStatusByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shiftingShipmentOrderEntity')
            ->select('shiftingShipmentOrderEntity.status')

            ->andWhere('shiftingShipmentOrderEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shiftingShipmentOrderEntity.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getShiftingShipmentOrderByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shiftingShipmentOrderEntity')
            ->select('shiftingShipmentOrderEntity.id', 'shiftingShipmentOrderEntity.shipmentID', 'shiftingShipmentOrderEntity.trackNumber', 'shiftingShipmentOrderEntity.fromImportWarehouseID', 'shiftingShipmentOrderEntity.toImportWarehouseID',
                'shiftingShipmentOrderEntity.status', 'shiftingShipmentOrderEntity.notes', 'shiftingShipmentOrderEntity.createdAt', 'shiftingShipmentOrderEntity.createdBy', 'shiftingShipmentOrderEntity.updatedAt', 'shiftingShipmentOrderEntity.updatedBy')

            ->andWhere('shiftingShipmentOrderEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shiftingShipmentOrderEntity.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

}
