<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\TravelFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TravelFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method TravelFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method TravelFinanceEntity[]    findAll()
 * @method TravelFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TravelFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TravelFinanceEntity::class);
    }

    public function getCurrentTotalCostByFilterOptions($travelID, $status)
    {
        $query = $this->createQueryBuilder('travelFinance')
            ->select('SUM(travelFinance.stageCost) as currentTotalCost');

        if($travelID)
        {
            $query->andWhere('travelFinance.travelID = :travelID');
            $query->setParameter('travelID', $travelID);
        }

        if($status)
        {
            $query->andWhere('travelFinance.status = :status');
            $query->setParameter('status', $status);
        }
        
        return $query->getQuery()->getOneOrNullResult();
    }

    public function filterTravelFinances($travelID, $status)
    {
        $query = $this->createQueryBuilder('travelFinance')
            ->select('travelFinance.id', 'travelFinance.travelID', 'travelFinance.status', 'travelFinance.stageCost', 'travelFinance.stageDescription', 'travelFinance.currency', 
            'travelFinance.createdAt', 'travelFinance.updatedAt', 'travelFinance.createdBy', 'travelFinance.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = travelFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = travelFinance.updatedBy'
            )

            ->orderBy('travelFinance.id', 'DESC');

        if($travelID)
        {
            $query->andWhere('travelFinance.travelID = :travelID');
            $query->setParameter('travelID', $travelID);
        }

        if($status)
        {
            $query->andWhere('travelFinance.status = :status');
            $query->setParameter('status', $status);
        }
        
        return $query->getQuery()->getResult();
    }

    public function deleteAllTravelsFinances()
    {
        return $this->createQueryBuilder('travel_finance_entity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
