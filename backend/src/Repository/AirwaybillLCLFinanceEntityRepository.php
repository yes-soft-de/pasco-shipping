<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillLCLFinanceEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillLCLFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillLCLFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillLCLFinanceEntity[]    findAll()
 * @method AirwaybillLCLFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillLCLFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillLCLFinanceEntity::class);
    }

    public function getCurrentTotalCostByFilterOptions($airWaybillID, $status)
    {
        $query = $this->createQueryBuilder('airWaybillLCLFinanceEntity')
            ->select('SUM(airWaybillLCLFinanceEntity.stageCost) as currentTotalCost');

        if($airWaybillID)
        {
            $query->andWhere('airWaybillLCLFinanceEntity.airwaybillID = :airwaybillID');
            $query->setParameter('airwaybillID', $airWaybillID);
        }

        if($status)
        {
            $query->andWhere('airWaybillLCLFinanceEntity.status = :status');
            $query->setParameter('status', $status);
        }
        
        return $query->getQuery()->getOneOrNullResult();
    }

    public function filterAirWaybillLCLFinances($airWaybillID, $status)
    {
        $query = $this->createQueryBuilder('airWaybillLCLFinanceEntity')
            ->select('airWaybillLCLFinanceEntity.id', 'airWaybillLCLFinanceEntity.airwaybillID', 'airWaybillLCLFinanceEntity.status', 'airWaybillLCLFinanceEntity.stageCost', 'airWaybillLCLFinanceEntity.stageDescription', 'airWaybillLCLFinanceEntity.currency', 'airWaybillLCLFinanceEntity.createdAt',
                'airWaybillLCLFinanceEntity.updatedAt', 'airWaybillLCLFinanceEntity.createdBy', 'airWaybillLCLFinanceEntity.updatedBy', 'airWaybillLCLFinanceEntity.subcontractID', 'airWaybillLCLFinanceEntity.importWarehouseID', 'airWaybillLCLFinanceEntity.paymentType',
                'airWaybillLCLFinanceEntity.financialFundName', 'airWaybillLCLFinanceEntity.chequeNumber', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'subcontractEntity.fullName as subcontractName', 'warehouseEntity.name as importWarehouseName')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airWaybillLCLFinanceEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airWaybillLCLFinanceEntity.updatedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airWaybillLCLFinanceEntity.subcontractID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'warehouseEntity',
                Join::WITH,
                'warehouseEntity.id = airWaybillLCLFinanceEntity.importWarehouseID'
            )

            ->orderBy('airWaybillLCLFinanceEntity.id', 'DESC');

        if($airWaybillID)
        {
            $query->andWhere('airWaybillLCLFinanceEntity.airwaybillID = :airwaybillID');
            $query->setParameter('airwaybillID', $airWaybillID);
        }

        if($status)
        {
            $query->andWhere('airWaybillLCLFinanceEntity.status = :status');
            $query->setParameter('status', $status);
        }
        
        return $query->getQuery()->getResult();
    }

    public function deleteAllAirWaybillsLCLFinances()
    {
        return $this->createQueryBuilder('airWaybillLCLFinanceEntity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
