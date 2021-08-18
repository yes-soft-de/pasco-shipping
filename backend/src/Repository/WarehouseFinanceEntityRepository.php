<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\WarehouseFinanceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method WarehouseFinanceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method WarehouseFinanceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method WarehouseFinanceEntity[]    findAll()
 * @method WarehouseFinanceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class WarehouseFinanceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, WarehouseFinanceEntity::class);
    }

    public function filterWarehouseFinances($warehouseID)
    {
        $query = $this->createQueryBuilder('warehouseFinance')
            ->select('warehouseFinance.id', 'warehouseFinance.warehouseID', 'warehouseFinance.cost', 'warehouseFinance.description', 'warehouseFinance.currency', 'warehouseFinance.createdAt', 
            'warehouseFinance.updatedAt', 'warehouseFinance.createdBy', 'warehouseFinance.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = warehouseFinance.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = warehouseFinance.updatedBy'
            )

            ->orderBy('warehouseFinance.id', 'DESC');

        if($warehouseID)
        {
            $query->andWhere('warehouseFinance.warehouseID = :warehouseID');
            $query->setParameter('warehouseID', $warehouseID);
        }
        
        return $query->getQuery()->getResult();
    }

}
