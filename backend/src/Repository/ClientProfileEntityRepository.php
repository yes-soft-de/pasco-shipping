<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
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

            ->addSelect('profile.userName', 'profile.image', 'profile.country', 'profile.city', 'profile.city', 'profile.location', 'profile.phone', 'profile.identificationNumber')

            ->andWhere('profile.userID = :userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getClientByIdentificationNumber($identificationNumber)
    {
        return $this->createQueryBuilder('profile')

            ->addSelect('profile.userName', 'profile.image', 'profile.country', 'profile.city', 'profile.city', 'profile.location', 'profile.phone', 'profile.identificationNumber')

            ->andWhere('profile.identificationNumber = :identificationNumber')
            ->setParameter('identificationNumber', $identificationNumber)

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

    public function filterClients($name)
    {
        $query = $this->createQueryBuilder('profile')
            ->select('profile.id', 'profile.userID', 'profile.phone', 'profile.city', 'profile.image', 'profile.userName', 'profile.location', 'profile.identificationNumber', 'userEntity.roles',
            'userEntity.email', 'userEntity.createAt', 'userEntity.createdBy', 'userEntity.updatedBy', 'adminProfile1.userName as createdByUser',
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserEntity::class,
                'userEntity',
                Join::WITH,
                'userEntity.id = profile.userID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = userEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = userEntity.updatedBy'
            )

            ->orderBy('profile.id', 'DESC');

        if($name)
        {
            $query->andWhere('profile.userName LIKE :name');
            $query->setParameter('name', '%'.$name.'%');
        }

        return $query->getQuery()->getResult();

    }

}
