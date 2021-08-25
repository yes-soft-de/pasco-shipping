<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\UserEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AdminProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AdminProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AdminProfileEntity[]    findAll()
 * @method AdminProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AdminProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AdminProfileEntity::class);
    }

    public function getProfileByUserID($userID)
    {
        return $this->createQueryBuilder('profile')

            ->addSelect('profile.userName', 'profile.image', 'profile.phone', 'userEntity.roles')

            ->andWhere('profile.userID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserEntity::class,
                'userEntity',
                Join::WITH,
                'userEntity.id = profile.userID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAllEmployees()
    {
        return $this->createQueryBuilder('profile')

        ->addSelect('profile.id', 'profile.userID', 'profile.userName', 'profile.image', 'profile.phone', 'userEntity.email')

        ->leftJoin(
            UserEntity::class,
            'userEntity',
            Join::WITH,
            'userEntity.id = profile.userID'
        )

        ->andWhere('userEntity.roles LIKE :role')
        ->setParameter('role', '%'."ROLE_EMPLOYEE".'%')

        ->orderBy('profile.id', 'DESC')

        ->getQuery()
        ->getResult();
    }

    public function getAllAdministrators()
    {
        return $this->createQueryBuilder('profile')

        ->addSelect('profile.id', 'profile.userID', 'profile.userName', 'profile.image', 'profile.phone', 'userEntity.email')

        ->leftJoin(
            UserEntity::class,
            'userEntity',
            Join::WITH,
            'userEntity.id = profile.userID'
        )

        ->andWhere('userEntity.roles LIKE :role')
        ->setParameter('role', '%'."ROLE_ADMIN".'%')

        ->orderBy('profile.id', 'DESC')

        ->getQuery()
        ->getResult();
    }

}
