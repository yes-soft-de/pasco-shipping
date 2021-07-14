<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ProductCategoryEntity;
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
            ->select('productCategory.id', 'productCategory.name', 'productCategory.description', 'productCategory.hsCode', 'productCategory.createdAt', 'productCategory.updatedAt', 'productCategory.createdBy', 'productCategory.updatedBy',
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = productCategory.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = productCategory.updatedBy'
            )

            ->orderBy('productCategory.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
