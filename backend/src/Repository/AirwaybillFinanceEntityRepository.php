<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillFinanceEntity[]    findAll()
 * @method AirwaybillFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillFinanceEntity::class);
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

    public function filterAirwaybillFinances($airwaybillID, $status)
    {
        $query = $this->createQueryBuilder('airwaybillFinance')
            ->select('airwaybillFinance.id', 'airwaybillFinance.airwaybillID', 'airwaybillFinance.status', 'airwaybillFinance.stageCost', 'airwaybillFinance.stageDescription',
            'airwaybillFinance.currency', 'airwaybillFinance.createdAt', 'airwaybillFinance.updatedAt', 'airwaybillFinance.createdBy', 'airwaybillFinance.updatedBy', 
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

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

    public function deleteAllAirwaybillsFinances()
    {
        return $this->createQueryBuilder('airwaybill_finance_entity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
