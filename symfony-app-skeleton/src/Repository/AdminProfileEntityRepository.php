<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
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

            ->addSelect('profile.userName', 'profile.image', 'profile.phone')

            ->andWhere('profile.userID = :userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

}
