<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\ContainerSpecificationPriceEntity;
use App\Entity\CountryEntity;
use App\Entity\PortsEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerSpecificationPriceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerSpecificationPriceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerSpecificationPriceEntity[]    findAll()
 * @method ContainerSpecificationPriceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerSpecificationPriceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerSpecificationPriceEntity::class);
    }

    public function getAllContainerSpecificationPrices()
    {
        return $this->createQueryBuilder('containerSpecificationPriceEntity')
            ->select('containerSpecificationPriceEntity.id', 'containerSpecificationPriceEntity.exportCountryID', 'containerSpecificationPriceEntity.exportCity', 'containerSpecificationPriceEntity.destinationPortID', 'containerSpecificationPriceEntity.price',
             'containerSpecificationPriceEntity.containerSpecificationID', 'containerSpecificationPriceEntity.createdAt', 'containerSpecificationPriceEntity.createdBy', 'containerSpecificationPriceEntity.updatedAt', 'containerSpecificationPriceEntity.updatedBy',
             'containerSpecificationEntity.name as containerSpecificationName', 'countryEntity.name as exportCountryName', 'portsEntity.name as destinationPortName', 'adminProfileEntityOne.userName as createdByUser', 'adminProfileEntityOne.image as createdByUserImage',
                'adminProfileEntityTwo.userName as updatedByUser', 'adminProfileEntityTwo.image as updatedByUserImage')

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecificationEntity',
                Join::WITH,
                'containerSpecificationEntity.id = containerSpecificationPriceEntity.containerSpecificationID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity',
                Join::WITH,
                'countryEntity.id = containerSpecificationPriceEntity.exportCountryID'
            )

            ->leftJoin(
                PortsEntity::class,
                'portsEntity',
                Join::WITH,
                'portsEntity.id = containerSpecificationPriceEntity.destinationPortID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityOne',
                Join::WITH,
                'adminProfileEntityOne.userID = containerSpecificationPriceEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityTwo',
                Join::WITH,
                'adminProfileEntityTwo.userID = containerSpecificationPriceEntity.updatedBy'
            )

            ->orderBy('containerSpecificationPriceEntity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getContainerSpecificationPriceBySpecificationIdAndExportCountryIdAndExportCityAndDestinationPortID($specificationID, $exportCountryID, $exportCity, $destinationPortID)
    {
        return $this->createQueryBuilder('containerSpecificationPriceEntity')
            ->select('containerSpecificationPriceEntity.price')

            ->andWhere('containerSpecificationPriceEntity.containerSpecificationID = :containerSpecificationID')
            ->setParameter('containerSpecificationID', $specificationID)

            ->andWhere('containerSpecificationPriceEntity.exportCountryID = :exportCountryID')
            ->setParameter('exportCountryID', $exportCountryID)

            ->andWhere('containerSpecificationPriceEntity.exportCity = :exportCity')
            ->setParameter('exportCity', $exportCity)

            ->andWhere('containerSpecificationPriceEntity.destinationPortID = :destinationPortID')
            ->setParameter('destinationPortID', $destinationPortID)

            ->getQuery()
            ->getOneOrNullResult();
    }

}
