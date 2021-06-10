<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
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
                'supplier.createdBy', 'supplier.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = supplier.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = supplier.updatedBy'
            )

            ->orderBy('supplier.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
