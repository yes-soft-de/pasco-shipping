<?php

namespace App\Repository;

use App\Entity\ContainerFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerFinanceEntity[]    findAll()
 * @method ContainerFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerFinanceEntity::class);
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

}
