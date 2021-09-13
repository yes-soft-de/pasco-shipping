<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\GunnyEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method GunnyEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method GunnyEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method GunnyEntity[]    findAll()
 * @method GunnyEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GunnyEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GunnyEntity::class);
    }

    public function getGunnyByIdentificationNumber($identificationNumber)
    {
        return $this->createQueryBuilder('gunnyEntity')
            ->select('gunnyEntity.id', 'gunnyEntity.identificationNumber', 'gunnyEntity.createdAt', 'gunnyEntity.createdBy', 'gunnyEntity.updatedAt', 'gunnyEntity.updatedBy', 'gunnyEntity.status')

            ->andWhere('gunnyEntity.identificationNumber = :identificationNumber')
            ->setParameter('identificationNumber', $identificationNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getGunnyByStatus($status)
    {
        return $this->createQueryBuilder('gunnyEntity')
            ->select('gunnyEntity.id', 'gunnyEntity.identificationNumber', 'gunnyEntity.createdAt', 'gunnyEntity.createdBy', 'gunnyEntity.updatedAt', 'gunnyEntity.updatedBy', 'gunnyEntity.status')

            ->andWhere('gunnyEntity.status = :status')
            ->setParameter('status', $status)

            ->orderBy('gunnyEntity.id', "DESC")

            ->getQuery()
            ->getResult();
    }

    public function getGunnyStatusByGunnyID($gunnyID)
    {
        return $this->createQueryBuilder('gunnyEntity')
            ->select('gunnyEntity.status')

            ->andWhere('gunnyEntity.id = :id')
            ->setParameter('id', $gunnyID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterGunnies($identificationNumber, $status)
    {
        $query = $this->createQueryBuilder('gunnyEntity')
            ->select('gunnyEntity.id', 'gunnyEntity.identificationNumber', 'gunnyEntity.createdAt', 'gunnyEntity.createdBy', 'gunnyEntity.updatedAt', 'gunnyEntity.updatedBy', 'gunnyEntity.status',
             'adminProfileEntity.userName as createdByUser', 'adminProfileEntity.image as createdByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntity',
                Join::WITH,
                'adminProfileEntity.userID = gunnyEntity.createdBy'
            )

            ->orderBy('gunnyEntity.id', "DESC");

        if($identificationNumber)
        {
            $query->andWhere('gunnyEntity.identificationNumber = :identificationNumber');
            $query->setParameter('identificationNumber', $identificationNumber);
        }

        if($status)
        {
            $query->andWhere('gunnyEntity.status = :status');
            $query->setParameter('status', $status);
        }

        return $query->getQuery()->getResult();
    }

}
