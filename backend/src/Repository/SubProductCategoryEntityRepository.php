<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\SubProductCategoryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SubProductCategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SubProductCategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SubProductCategoryEntity[]    findAll()
 * @method SubProductCategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SubProductCategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SubProductCategoryEntity::class);
    }

    public function getAllSubProductCategories()
    {
        return $this->createQueryBuilder('subproductCategory')
            ->select('subproductCategory.id', 'subproductCategory.name', 'subproductCategory.description', 'subproductCategory.productCategoryID', 'subproductCategory.hsCode', 'subproductCategory.createdAt', 'subproductCategory.updatedAt', 'subproductCategory.createdBy', 
            'subproductCategory.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'productCategoryEntity.name as productCategoryName')

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategoryEntity',
                Join::WITH,
                'productCategoryEntity.id = subproductCategory.productCategoryID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subproductCategory.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subproductCategory.updatedBy'
            )

            ->orderBy('subproductCategory.id', 'DESC')

            ->getQuery()
            ->getResult();
    }
    
}
