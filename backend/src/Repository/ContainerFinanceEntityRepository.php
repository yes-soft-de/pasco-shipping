<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ContainerFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
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

    public function filterContainerFinances($containerID, $status)
    {
        $query = $this->createQueryBuilder('containerFinance')
            ->select('containerFinance.id', 'containerFinance.containerID', 'containerFinance.status', 'containerFinance.stageCost', 'containerFinance.stageDescription',
            'containerFinance.currency', 'containerFinance.createdAt', 'containerFinance.updatedAt', 'containerFinance.createdBy', 'containerFinance.updatedBy', 
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

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

    public function deleteAllContainersFinances()
    {
        return $this->createQueryBuilder('container_finance_entity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
