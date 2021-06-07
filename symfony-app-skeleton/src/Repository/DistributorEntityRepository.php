<?php

namespace App\Repository;

use App\Entity\DistributorEntity;
use App\Entity\UserProfileEntity;
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
             'distributor.createdBy', 'distributor.updatedBy', 'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage',
                'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = distributor.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = distributor.updatedBy'
            )

            ->orderBy('distributor.id', 'DESC')

            ->getQuery()
            ->getResult();
    }
}
