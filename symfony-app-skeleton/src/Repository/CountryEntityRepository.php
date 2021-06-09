<?php

namespace App\Repository;

use App\Entity\CountryEntity;
use App\Entity\UserProfileEntity;
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
            ->select('country.id', 'country.name', 'country.createdAt', 'country.updatedAt', 'country.createdBy', 'country.updatedBy',
                'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage', 'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = country.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = country.updatedBy'
            )

            ->orderBy('country.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
