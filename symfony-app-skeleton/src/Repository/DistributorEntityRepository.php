<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method DistributorEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method DistributorEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method DistributorEntity[]    findAll()
 * @method DistributorEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DistributorEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DistributorEntity::class);
    }

    public function getAllDistributors()
    {
        return $this->createQueryBuilder('distributor')
            ->select('distributor.id', 'distributor.fullName', 'distributor.phone', 'distributor.address', 'distributor.createdAt', 'distributor.updatedAt',
             'distributor.createdBy', 'distributor.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = distributor.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = distributor.updatedBy'
            )

            ->orderBy('distributor.id', 'DESC')

            ->getQuery()
            ->getResult();
    }
}
