<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ContainerFCLFinanceEntity;
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

    public function getCurrentTotalCostByFilterOptions($containerID, $status)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('SUM(containerFinance.stageCost) as currentTotalCost');

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

    public function getContainerFCLTotalCostByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('containerFinance')
            ->select('SUM(containerFinance.stageCost) as currentTotalCost')

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
            ->select('containerFinance.status', 'containerFinance.stageCost', 'containerFinance.stageDescription')

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.trackNumber = containerFinance.trackNumber'
            )

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getResult();
    }

    public function filterContainerFCLFinances($containerID, $status)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.id', 'containerFinance.containerID', 'containerFinance.status', 'containerFinance.stageCost', 'containerFinance.stageDescription', 'containerFinance.currency', 'containerFinance.createdAt',
                'containerFinance.updatedAt', 'containerFinance.createdBy', 'containerFinance.updatedBy', 'containerFinance.subcontractID', 'containerFinance.importWarehouseID', 'containerFinance.clientUserID', 'containerFinance.paymentType',
                'containerFinance.financialFundName', 'containerFinance.chequeNumber', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'subcontractEntity.fullName as subcontractName', 'warehouseEntity.name as importWarehouseName', 'clientProfileEntity.userName as clientUsername')

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
