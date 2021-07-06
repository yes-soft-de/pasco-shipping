<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CountryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method CountryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method CountryEntity[]    findAll()
 * @method CountryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CountryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CountryEntity::class);
    }

    public function getAllCountries()
    {
        return $this->createQueryBuilder('country')
            ->select('country.id', 'country.name', 'country.createdAt', 'country.updatedAt', 'country.createdBy', 'country.updatedBy', 'country.type',
                'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = country.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = country.updatedBy'
            )

            ->orderBy('country.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
