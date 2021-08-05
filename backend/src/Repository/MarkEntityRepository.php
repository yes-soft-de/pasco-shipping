<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\MarkEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method MarkEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method MarkEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method MarkEntity[]    findAll()
 * @method MarkEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MarkEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MarkEntity::class);
    }

    public function getAllMarksByUser($userID)
    {
        return $this->createQueryBuilder('mark')
            ->select('mark.id', 'mark.clientUserID', 'mark.markNumber', 'mark.createdAt', 'mark.updatedAt', 'mark.createdBy', 'mark.updatedBy', 'adminProfile1.userName as createdByUser', 
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('mark.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = mark.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = mark.updatedBy'
            )

            ->orderBy('mark.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
