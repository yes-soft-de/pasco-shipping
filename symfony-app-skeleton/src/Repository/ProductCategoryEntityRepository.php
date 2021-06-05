<?php

namespace App\Repository;

use App\Entity\ProductCategoryEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ProductCategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProductCategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProductCategoryEntity[]    findAll()
 * @method ProductCategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductCategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProductCategoryEntity::class);
    }

    public function getAllProductCategories()
    {
        return $this->createQueryBuilder('productCategory')
            ->select('productCategory.id', 'productCategory.name', 'productCategory.description', 'productCategory.createdAt', 'productCategory.updatedAt', 'productCategory.createdBy', 'productCategory.updatedBy',
            'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage', 'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = productCategory.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = productCategory.updatedBy'
            )

            ->orderBy('productCategory.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
