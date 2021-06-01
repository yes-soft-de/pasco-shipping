<?php

namespace App\Repository;

use App\Entity\ContainerEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerEntity[]    findAll()
 * @method ContainerEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerEntity::class);
    }

    public function getByStatus($status)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy',
             'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage', 'userProfile2.userName as updatedByUser', 'userProfile2.userName as updatedByUserImage')

            ->andWhere('container.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = container.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = container.updatedBy'
            )

            ->orderBy('container.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

}
