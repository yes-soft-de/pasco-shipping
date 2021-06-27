<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\ProxyEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method WarehouseEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method WarehouseEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method WarehouseEntity[]    findAll()
 * @method WarehouseEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class WarehouseEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, WarehouseEntity::class);
    }

    public function getAllWarehouses()
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.proxyID', 'warehouse.rentingFee',
             'warehouse.name', 'warehouse.createdAt', 'warehouse.updatedAt', 'warehouse.createdBy', 'warehouse.updatedBy', 'country.name as countryName',
                'proxy.fullName as proxyName', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'warehouse.subcontractID',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'subcontract.fullName as subcontractName')

            ->leftJoin(
                CountryEntity::class,
                'country',
                Join::WITH,
                'country.id = warehouse.countryID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxy',
                Join::WITH,
                'proxy.id = warehouse.proxyID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = warehouse.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = warehouse.updatedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontract',
                Join::WITH,
                'subcontract.id = warehouse.subcontractID'
            )

            ->orderBy('warehouse.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getWarehousesByCountryID($countryID)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.proxyID', 'warehouse.rentingFee',
                'warehouse.name', 'warehouse.createdAt', 'warehouse.updatedAt', 'warehouse.createdBy', 'warehouse.updatedBy', 'country.name as countryName',
                'proxy.fullName as proxyName', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'warehouse.subcontractID',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'subcontract.fullName as subcontractName')

            ->andWhere('warehouse.countryID = :countryID')
            ->setParameter('countryID', $countryID)

            ->leftJoin(
                CountryEntity::class,
                'country',
                Join::WITH,
                'country.id = warehouse.countryID'
            )

            ->leftJoin(
                ProxyEntity::class,
                'proxy',
                Join::WITH,
                'proxy.id = warehouse.proxyID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = warehouse.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = warehouse.updatedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontract',
                Join::WITH,
                'subcontract.id = warehouse.subcontractID'
            )

            ->orderBy('warehouse.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
