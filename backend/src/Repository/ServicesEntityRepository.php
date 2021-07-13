<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ServicesEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ServicesEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ServicesEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ServicesEntity[]    findAll()
 * @method ServicesEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ServicesEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ServicesEntity::class);
    }

    public function getAllServices()
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.name', 'service.description', 'service.createdAt', 'service.updatedAt', 'service.createdBy', 'service.updatedBy',
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 
            'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = service.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = service.updatedBy'
            )

            ->orderBy('service.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getServiceById($id)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.name', 'service.description', 'service.createdAt', 'service.updatedAt', 'service.createdBy', 'service.updatedBy',
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 
            'adminProfile2.image as updatedByUserImage')

            ->andWhere('service.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = service.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = service.updatedBy'
            )

            ->orderBy('service.id', 'DESC')

            ->getQuery()
            ->getOneOrNullResult();
    }

}