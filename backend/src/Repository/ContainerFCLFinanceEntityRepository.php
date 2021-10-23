<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ContainerFCLFinanceEntity;
use App\Entity\ProxyEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerFCLFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerFCLFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerFCLFinanceEntity[]    findAll()
 * @method ContainerFCLFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerFCLFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerFCLFinanceEntity::class);
    }

    public function getCurrentTotalBuyingCostByFilterOptions($containerID, $status)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('SUM(containerFinance.buyingCost) as currentTotalBuyingCost');

        if($containerID)
        {
            $query->andWhere('containerFinance.containerID = :containerID');
            $query->setParameter('containerID', $containerID);
        }

        if($status)
        {
            $query->andWhere('containerFinance.status = :status');
            $query->setParameter('status', $status);
        }
        
        return $query->getQuery()->getOneOrNullResult();
    }

    public function getCurrentTotalSellingCostByFilterOptions($containerID, $status)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('SUM(containerFinance.sellingCost) as currentTotalSellingCost');

        if($containerID)
        {
            $query->andWhere('containerFinance.containerID = :containerID');
            $query->setParameter('containerID', $containerID);
        }

        if($status)
        {
            $query->andWhere('containerFinance.status = :status');
            $query->setParameter('status', $status);
        }

        return $query->getQuery()->getOneOrNullResult();
    }

    public function getContainerFCLTotalSellingCostByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('containerFinance')
            ->select('SUM(containerFinance.sellingCost) as currentTotalCost')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = containerFinance.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getSingleScalarResult();
    }

    public function getContainerFCLBillDetailsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.status', 'containerFinance.sellingCost', 'containerFinance.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = containerFinance.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("containerFinance.buyingCost IS NULL")

            ->getQuery()
            ->getResult();
    }

    public function getContainerFCLBuyingDetailsByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.status', 'containerFinance.buyingCost', 'containerFinance.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = containerFinance.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("containerFinance.sellingCost IS NULL")

            ->getQuery()
            ->getResult();
    }

    public function getContainerFCLBuyingStagesByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.containerID', 'containerFinance.status', 'containerFinance.buyingCost', 'containerFinance.stageDescription', 'containerFinance.proxyID', 'containerFinance.paymentType',
             'containerFinance.createdAt', 'containerFinance.updatedAt', 'containerFinance.createdBy', 'containerFinance.updatedBy', 'containerFinance.currency', 'containerFinance.subcontractID', 'subcontractEntity.fullName as subcontractName',
                'proxyEntity.fullName as proxyName', 'adminProfileEntityOne.userName as createdByUser', 'adminProfileEntityOne.image as createdByUserImage', 'adminProfileEntityTwo.userName as updatedByUser', 'adminProfileEntityTwo.image as updatedByUserImage')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = containerFinance.trackNumber'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = containerFinance.subcontractID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxyEntity',
                Join::WITH,
                'proxyEntity.id = containerFinance.proxyID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityOne',
                Join::WITH,
                'adminProfileEntityOne.userID = containerFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityTwo',
                Join::WITH,
                'adminProfileEntityTwo.userID = containerFinance.updatedBy'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere("containerFinance.sellingCost IS NULL OR containerFinance.sellingCost = :sellingCost")
            ->setParameter('sellingCost', 0)

            ->getQuery()
            ->getResult();
    }

    public function filterContainerFCLFinances($containerID, $status, $purchaseBill)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.id', 'containerFinance.containerID', 'containerFinance.status', 'containerFinance.stageCost', 'containerFinance.stageDescription', 'containerFinance.currency', 'containerFinance.createdAt',
                'containerFinance.updatedAt', 'containerFinance.createdBy', 'containerFinance.updatedBy', 'containerFinance.subcontractID', 'containerFinance.importWarehouseID', 'containerFinance.clientUserID', 'containerFinance.paymentType',
                'containerFinance.buyingCost', 'containerFinance.sellingCost', 'containerFinance.proxyID', 'containerFinance.chequeNumber', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'subcontractEntity.fullName as subcontractName', 'warehouseEntity.name as importWarehouseName', 'clientProfileEntity.userName as clientUsername',
             'proxyEntity.fullName as proxyName')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = containerFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = containerFinance.updatedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = containerFinance.subcontractID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'warehouseEntity',
                Join::WITH,
                'warehouseEntity.id = containerFinance.importWarehouseID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = containerFinance.clientUserID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxyEntity',
                Join::WITH,
                'proxyEntity.id = containerFinance.proxyID'
            )

            ->orderBy('containerFinance.id', 'DESC');

        if($containerID)
        {
            $query->andWhere('containerFinance.containerID = :containerID');
            $query->setParameter('containerID', $containerID);
        }

        if($status)
        {
            $query->andWhere('containerFinance.status = :status');
            $query->setParameter('status', $status);
        }

        if($purchaseBill == true)
        {
            $query->andWhere('containerFinance.buyingCost != :buyingCost AND containerFinance.buyingCost IS NOT NULL');
            $query->setParameter('buyingCost', 0);
        }
        
        return $query->getQuery()->getResult();
    }

    public function deleteAllContainersFCLFinances()
    {
        return $this->createQueryBuilder('container_finance_entity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
