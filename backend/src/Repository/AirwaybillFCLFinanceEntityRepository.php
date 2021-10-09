<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillFCLFinanceEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillFCLFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillFCLFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillFCLFinanceEntity[]    findAll()
 * @method AirwaybillFCLFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillFCLFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillFCLFinanceEntity::class);
    }

    public function getCurrentTotalCostByFilterOptions($airwaybillID, $status)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('SUM(airwaybillFinance.stageCost) as currentTotalCost');

        if($airwaybillID)
        {
            $query->andWhere('airwaybillFinance.airwaybillID = :airwaybillID');
            $query->setParameter('airwaybillID', $airwaybillID);
        }

        if($status)
        {
            $query->andWhere('airwaybillFinance.status = :status');
            $query->setParameter('status', $status);
        }

        return $query->getQuery()->getOneOrNullResult();
    }

    public function getAirWaybillFCLTotalCostByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->select('SUM(airwaybillFCLFinanceEntity.stageCost) as currentTotalCost')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = airwaybillFCLFinanceEntity.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getSingleScalarResult();
    }

    public function getAirWaybillFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->select('airwaybillFCLFinanceEntity.status', 'airwaybillFCLFinanceEntity.stageCost', 'airwaybillFCLFinanceEntity.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = airwaybillFCLFinanceEntity.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getResult();
    }

    public function filterAirWaybillFCLFinances($airwaybillID, $status)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('airwaybillFinance.id', 'airwaybillFinance.airwaybillID', 'airwaybillFinance.status', 'airwaybillFinance.stageCost', 'airwaybillFinance.stageDescription', 'airwaybillFinance.clientUserID', 'airwaybillFinance.chequeNumber',
            'airwaybillFinance.currency', 'airwaybillFinance.createdAt', 'airwaybillFinance.updatedAt', 'airwaybillFinance.createdBy', 'airwaybillFinance.updatedBy', 'airwaybillFinance.subcontractID', 'airwaybillFinance.importWarehouseID',
            'airwaybillFinance.paymentType', 'airwaybillFinance.financialFundName', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
                'subcontractEntity.fullName as subcontractName', 'warehouseEntity.name as importWarehouseName', 'clientProfileEntity.userName as clientUsername')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybillFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybillFinance.updatedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybillFinance.subcontractID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'warehouseEntity',
                Join::WITH,
                'warehouseEntity.id = airwaybillFinance.importWarehouseID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = airwaybillFinance.clientUserID'
            )

            ->orderBy('airwaybillFinance.id', 'DESC');

        if($airwaybillID)
        {
            $query->andWhere('airwaybillFinance.airwaybillID = :airwaybillID');
            $query->setParameter('airwaybillID', $airwaybillID);
        }

        if($status)
        {
            $query->andWhere('airwaybillFinance.status = :status');
            $query->setParameter('status', $status);
        }

        return $query->getQuery()->getResult();
    }

    public function deleteAllAirwaybillsFCLFinances()
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
