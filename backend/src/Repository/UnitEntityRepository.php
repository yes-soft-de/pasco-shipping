<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\UnitEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method UnitEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method UnitEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method UnitEntity[]    findAll()
 * @method UnitEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UnitEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UnitEntity::class);
    }

    public function getAllUnits()
    {
        return $this->createQueryBuilder('unit')
            ->select('unit.id', 'unit.name', 'unit.description', 'unit.createdAt', 'unit.updatedAt', 'unit.createdBy', 'unit.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = unit.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = unit.updatedBy'
            )

            ->orderBy('unit.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
