<?php

namespace App\Repository;

use App\Entity\ClientProfileEntity;
use App\Entity\UserEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ClientProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ClientProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ClientProfileEntity[]    findAll()
 * @method ClientProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ClientProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ClientProfileEntity::class);
    }

    public function getProfileByUserID($userID)
    {
        return $this->createQueryBuilder('profile')

            ->addSelect('profile.userName', 'profile.image', 'profile.country', 'profile.city', 'profile.city', 'profile.location', 'profile.phone')
            ->andWhere('profile.userID=:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getClientProfile($userID)
    {
        return $this->createQueryBuilder('profile')

            ->andWhere('profile.userID = :userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAllProfiles()
    {
        return $this->createQueryBuilder('profile')
            ->select('profile.id', 'profile.userID', 'profile.phone', 'profile.city', 'profile.image', 'profile.userName', 'profile.location',
            'userEntity.roles', 'userEntity.email')

            ->leftJoin(
                UserEntity::class,
                'userEntity',
                Join::WITH,
                'userEntity.id = profile.userID'
            )

            ->orderBy('profile.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
