<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\PriceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PriceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method PriceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method PriceEntity[]    findAll()
 * @method PriceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PriceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PriceEntity::class);
    }

    public function getPrices()
    {
        return $this->createQueryBuilder('priceEntity')
            ->select('priceEntity.id', 'priceEntity.oneKiloPrice', 'priceEntity.oneCBMPrice', 'priceEntity.updatedAt', 'priceEntity.updatedBy', 'adminProfileEntity.userName as updatedByUser',
                'adminProfileEntity.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity',
                Join::WITH,
                'adminProfileEntity.userID = priceEntity.updatedBy'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

}
