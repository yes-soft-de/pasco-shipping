<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillFCLFinanceEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ProxyEntity;
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

    public function getCurrentTotalBuyingCostByFilterOptions($airwaybillID, $status)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('SUM(airwaybillFinance.buyingCost) as currentTotalBuyingCost');

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

    public function getCurrentTotalSellingCostByFilterOptions($airwaybillID, $status)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('SUM(airwaybillFinance.sellingCost) as currentTotalSellingCost');

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

    public function getAirWaybillFCLTotalSellingCostByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->select('SUM(airwaybillFCLFinanceEntity.sellingCost) as currentTotalCost')

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
            ->select('airwaybillFCLFinanceEntity.status', 'airwaybillFCLFinanceEntity.sellingCost', 'airwaybillFCLFinanceEntity.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = airwaybillFCLFinanceEntity.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("airwaybillFCLFinanceEntity.buyingCost IS NULL OR airwaybillFCLFinanceEntity.buyingCost = :value")
            ->setParameter('value', 0)

            ->getQuery()
            ->getResult();
    }

    public function getAirWaybillFCLBuyingDetailsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->select('airwaybillFCLFinanceEntity.status', 'airwaybillFCLFinanceEntity.buyingCost', 'airwaybillFCLFinanceEntity.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = airwaybillFCLFinanceEntity.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("airwaybillFCLFinanceEntity.sellingCost IS NULL OR airwaybillFCLFinanceEntity.sellingCost = :sellingCost")
            ->setParameter('sellingCost', 0)

            ->getQuery()
            ->getResult();
    }

    public function getAirWaybillFCLBuyingStagesByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('airwaybillFCLFinanceEntity')
            ->select('airwaybillFCLFinanceEntity.airwaybillID', 'airwaybillFCLFinanceEntity.status', 'airwaybillFCLFinanceEntity.buyingCost', 'airwaybillFCLFinanceEntity.stageDescription',
             'airwaybillFCLFinanceEntity.createdAt', 'airwaybillFCLFinanceEntity.updatedAt', 'airwaybillFCLFinanceEntity.createdBy', 'airwaybillFCLFinanceEntity.updatedBy', 'airwaybillFCLFinanceEntity.currency',
             'airwaybillFCLFinanceEntity.subcontractID', 'airwaybillFCLFinanceEntity.proxyID', 'airwaybillFCLFinanceEntity.paymentType', 'subcontractEntity.fullName as subcontractName', 'proxyEntity.fullName as proxyName',
             'adminProfileEntityOne.userName as createdByUser', 'adminProfileEntityOne.image as createdByUserImage', 'adminProfileEntityTwo.userName as updatedByUser', 'adminProfileEntityTwo.image as updatedByUserImage')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = airwaybillFCLFinanceEntity.trackNumber'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybillFCLFinanceEntity.subcontractID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxyEntity',
                Join::WITH,
                'proxyEntity.id = airwaybillFCLFinanceEntity.proxyID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityOne',
                Join::WITH,
                'adminProfileEntityOne.userID = airwaybillFCLFinanceEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityTwo',
                Join::WITH,
                'adminProfileEntityTwo.userID = airwaybillFCLFinanceEntity.updatedBy'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("airwaybillFCLFinanceEntity.sellingCost IS NULL OR airwaybillFCLFinanceEntity.sellingCost = :sellingCost")
            ->setParameter('sellingCost', 0)

            ->getQuery()
            ->getResult();
    }

    public function filterAirWaybillFCLFinances($airwaybillID, $status, $purchaseBill)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('airwaybillFinance.id', 'airwaybillFinance.airwaybillID', 'airwaybillFinance.status', 'airwaybillFinance.stageCost', 'airwaybillFinance.stageDescription', 'airwaybillFinance.clientUserID', 'airwaybillFinance.chequeNumber',
            'airwaybillFinance.currency', 'airwaybillFinance.createdAt', 'airwaybillFinance.updatedAt', 'airwaybillFinance.createdBy', 'airwaybillFinance.updatedBy', 'airwaybillFinance.subcontractID', 'airwaybillFinance.importWarehouseID',
            'airwaybillFinance.buyingCost', 'airwaybillFinance.sellingCost', 'airwaybillFinance.paymentType', 'airwaybillFinance.proxyID', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'subcontractEntity.fullName as subcontractName', 'warehouseEntity.name as importWarehouseName', 'clientProfileEntity.userName as clientUsername',
             'proxyEntity.fullName as proxyName')

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

            ->leftJoin(
                ProxyEntity::class,
                'proxyEntity',
                Join::WITH,
                'proxyEntity.id = airwaybillFinance.proxyID'
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

        if($purchaseBill == true)
        {
            $query->andWhere('airwaybillFinance.buyingCost != :buyingCost AND airwaybillFinance.buyingCost IS NOT NULL');
            $query->setParameter('buyingCost', 0);
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
