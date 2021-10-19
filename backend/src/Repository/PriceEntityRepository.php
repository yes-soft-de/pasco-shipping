<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\PriceEntity;
use App\Request\PricesFilterRequest;
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

    public function getAllPrices()
    {
        return $this->createQueryBuilder('priceEntity')
            ->select('priceEntity.id', 'priceEntity.oneKiloPrice', 'priceEntity.oneCBMPrice', 'priceEntity.updatedAt', 'priceEntity.updatedBy', 'priceEntity.createdAt',
                'priceEntity.createdBy', 'priceEntity.exportCountryID', 'priceEntity.exportCity', 'priceEntity.importCountryID', 'priceEntity.importCity', 'adminProfileEntityOne.userName as createdByUser',
                'adminProfileEntityOne.image as createdByUserImage', 'adminProfileEntityTwo.userName as updatedByUser', 'adminProfileEntityTwo.image as updatedByUserImage', 'exportCountryEntity.name as exportCountryName', 'importCountryEntity.name as importCountryName')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityOne',
                Join::WITH,
                'adminProfileEntityOne.userID = priceEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityTwo',
                Join::WITH,
                'adminProfileEntityTwo.userID = priceEntity.updatedBy'
            )

            ->leftJoin(
                CountryEntity::class,
                'exportCountryEntity',
                Join::WITH,
                'exportCountryEntity.id = priceEntity.exportCountryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'importCountryEntity',
                Join::WITH,
                'importCountryEntity.id = priceEntity.importCountryID'
            )

            ->getQuery()
            ->getResult();
    }

    public function filterPrices(PricesFilterRequest $request)
    {
        $query = $this->createQueryBuilder('priceEntity')
            ->select('priceEntity.id', 'priceEntity.oneKiloPrice', 'priceEntity.oneCBMPrice', 'priceEntity.updatedAt', 'priceEntity.updatedBy', 'priceEntity.createdAt',
                'priceEntity.createdBy', 'priceEntity.exportCountryID', 'priceEntity.exportCity', 'priceEntity.importCountryID', 'priceEntity.importCity',
                'exportCountryEntity.name as exportCountryName', 'importCountryEntity.name as importCountryName')

            ->leftJoin(
                CountryEntity::class,
                'exportCountryEntity',
                Join::WITH,
                'exportCountryEntity.id = priceEntity.exportCountryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'importCountryEntity',
                Join::WITH,
                'importCountryEntity.id = priceEntity.importCountryID'
            )

            ->orderBy('priceEntity.id', 'DESC');

        if($request->getExportCountryID())
        {
            $query->andWhere('priceEntity.exportCountryID = :exportCountryID');
            $query->setParameter('exportCountryID', $request->getExportCountryID());
        }

        if($request->getExportCity())
        {
            $query->andWhere('priceEntity.exportCity = :exportCity');
            $query->setParameter('exportCity', $request->getExportCity());
        }

        if($request->getImportCountryID())
        {
            $query->andWhere('priceEntity.importCountryID = :importCountryID');
            $query->setParameter('importCountryID', $request->getImportCountryID());
        }

        if($request->getImportCity())
        {
            $query->andWhere('priceEntity.importCity = :importCity');
            $query->setParameter('importCity', $request->getImportCity());
        }

        return $query->getQuery()->getResult();
    }

}
