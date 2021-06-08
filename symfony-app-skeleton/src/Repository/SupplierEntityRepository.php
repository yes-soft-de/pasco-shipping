<?php

namespace App\Repository;

use App\Entity\SupplierEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SupplierEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SupplierEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SupplierEntity[]    findAll()
 * @method SupplierEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SupplierEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SupplierEntity::class);
    }

    public function getAllSuppliers()
    {
        return $this->createQueryBuilder('supplier')
            ->select('supplier.id', 'supplier.fullName', 'supplier.phone', 'supplier.address', 'supplier.createdAt', 'supplier.updatedAt',
                'supplier.createdBy', 'supplier.updatedBy', 'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage',
                'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = supplier.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = supplier.updatedBy'
            )

            ->orderBy('supplier.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
