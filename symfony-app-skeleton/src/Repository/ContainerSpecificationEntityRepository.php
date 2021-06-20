<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\SubcontractEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContainerSpecificationEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerSpecificationEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerSpecificationEntity[]    findAll()
 * @method ContainerSpecificationEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerSpecificationEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerSpecificationEntity::class);
    }

    public function getAllContainerSpecifications()
    {
        return $this->createQueryBuilder('containerSpecification')
            ->select('containerSpecification.id', 'containerSpecification.type', 'containerSpecification.providedBy', 'containerSpecification.capacityCPM', 'containerSpecification.widthInMeter',
            'containerSpecification.hightInMeter', 'containerSpecification.lengthInMeter', 'containerSpecification.createdAt', 'containerSpecification.updatedAt', 'containerSpecification.createdBy',
            'containerSpecification.updatedBy', 'subcontract.fullName as subcontractName', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                SubcontractEntity::class,
                'subcontract',
                Join::WITH,
                'subcontract.id = containerSpecification.providedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = containerSpecification.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = containerSpecification.updatedBy'
            )

            ->orderBy('containerSpecification.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
