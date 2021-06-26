<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillSpecificationEntity;
use App\Entity\SubcontractEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillSpecificationEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillSpecificationEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillSpecificationEntity[]    findAll()
 * @method AirwaybillSpecificationEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillSpecificationEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillSpecificationEntity::class);
    }

    public function getAllAirwaybillSpecifications()
    {
        return $this->createQueryBuilder('airwaybillSpecification')
            ->select('airwaybillSpecification.id', 'airwaybillSpecification.type', 'airwaybillSpecification.weight', 'airwaybillSpecification.providedBy', 'airwaybillSpecification.createdBy',
            'airwaybillSpecification.createdAt', 'airwaybillSpecification.updatedBy', 'airwaybillSpecification.updatedAt', 'subContract.fullName as subcontractName', 'adminProfile1.userName as createdByUser', 
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                SubcontractEntity::class,
                'subContract',
                Join::WITH,
                'subContract.id = airwaybillSpecification.providedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybillSpecification.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybillSpecification.updatedBy'
            )

            ->orderBy('airwaybillSpecification.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
