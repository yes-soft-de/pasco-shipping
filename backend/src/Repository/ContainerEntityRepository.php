<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ContainerEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\SubcontractEntity;
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
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.capacityCPM', 'containerSpecification.widthInMeter', 'containerSpecification.hightInMeter', 'containerSpecification.lengthInMeter', 'subcontractEntity.fullName as subcontractName',
             'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('container.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = container.providedBy'
            )

            ->orderBy('container.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getContainerById($id)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.capacityCPM', 'containerSpecification.widthInMeter', 'containerSpecification.hightInMeter', 'containerSpecification.lengthInMeter', 'subcontractEntity.fullName as subcontractName',
            'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('container.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = container.providedBy'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

}
