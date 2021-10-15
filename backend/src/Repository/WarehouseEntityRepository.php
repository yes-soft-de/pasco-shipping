<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\ProxyEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use App\Request\WarehouseFilterRequest;
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
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.type', 'warehouse.proxyID', 'warehouse.rentingFee',
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

    public function getCountryIdAndCityOfWarehouseByWarehouseID($warehouseID)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.city', 'warehouse.countryID')

            ->andWhere('warehouse.id = :warehouseID')
            ->setParameter('warehouseID', $warehouseID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterWarehouses(WarehouseFilterRequest $request)
    {
        $query = $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.type', 'warehouse.proxyID', 'warehouse.rentingFee',
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

            ->orderBy('warehouse.id', 'DESC');

        if($request->getTypeOfCountry())
        {
            $query->andWhere('country.type = :type');
            $query->setParameter('type', $request->getTypeOfCountry());
        }

        if($request->getCityName())
        {
            $query->andWhere('warehouse.city LIKE :city');
            $query->setParameter('city', '%'.$request->getCityName().'%');
        }

        if($request->getCountryID())
        {
            $query->andWhere('warehouse.countryID = :countryID');
            $query->setParameter('countryID', $request->getCountryID());
        }

        if($request->getCountriesIDs())
        {
            $query->andWhere('warehouse.countryID IN (:countriesIDs)');
            $query->setParameter('countriesIDs', $request->getCountriesIDs());
        }

        return $query->getQuery()->getResult();
    }

    public function getWarehousesByCity($city)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.type', 'warehouse.proxyID', 'warehouse.rentingFee',
                'warehouse.name', 'warehouse.createdAt', 'warehouse.updatedAt', 'warehouse.createdBy', 'warehouse.updatedBy', 'country.name as countryName',
                'proxy.fullName as proxyName', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'warehouse.subcontractID',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'subcontract.fullName as subcontractName')

            ->andWhere('warehouse.city = :city')
            ->setParameter('city', $city)

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
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID', 'warehouse.location', 'warehouse.type', 'warehouse.proxyID', 'warehouse.rentingFee',
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

    public function getUniqueCitiesNamesOfWarehousesByCountryId($countryID)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('DISTINCT(warehouse.city) as city', 'warehouse.countryID')

            ->andWhere('warehouse.countryID = :countryID')
            ->setParameter('countryID', $countryID)

            ->getQuery()
            ->getResult();
    }

    public function getSingleWarehouseByCountryIdAndCity($countryID, $city)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.name', 'warehouse.countryID', 'country.name as countryName')

            ->andWhere('warehouse.countryID = :countryID')
            ->setParameter('countryID', $countryID)

            ->andWhere('warehouse.city LIKE :city')
            ->setParameter('city', $city)

            ->leftJoin(
                CountryEntity::class,
                'country',
                Join::WITH,
                'country.id = warehouse.countryID'
            )

            ->setMaxResults(1)

            ->getQuery()
            ->getResult();
    }

    public function getWarehousesByCountryIdAndCity($countryID, $city)
    {
        return $this->createQueryBuilder('warehouse')
            ->select('warehouse.id', 'warehouse.city', 'warehouse.countryID')

            ->andWhere('warehouse.countryID = :countryID')
            ->setParameter('countryID', $countryID)

            ->andWhere('LOWER (warehouse.city) = :city')
            ->setParameter('city', strtolower($city))

            ->getQuery()
            ->getResult();
    }

    public function getByProxyID($proxyID)
    {
        return $this->createQueryBuilder('warehouse')

            ->andWhere('warehouse.proxyID = :proxyID')
            ->setParameter('proxyID', $proxyID)

            ->getQuery()
            ->getResult();
    }

}
