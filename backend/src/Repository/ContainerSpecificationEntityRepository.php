<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ContainerSpecificationEntity;
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
            ->select('containerSpecification.id', 'containerSpecification.name', 'containerSpecification.capacityCPM', 'containerSpecification.widthInMeter', 'containerSpecification.hightInMeter', 'containerSpecification.lengthInMeter', 
            'containerSpecification.price', 'containerSpecification.createdAt', 'containerSpecification.updatedAt', 'containerSpecification.createdBy', 'containerSpecification.updatedBy', 'adminProfile1.userName as createdByUser',
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

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

    public function getContainerSpecificationById($specificationID)
    {
        return $this->createQueryBuilder('containerSpecification')
            ->select('containerSpecification.id', 'containerSpecification.name', 'containerSpecification.capacityCPM', 'containerSpecification.widthInMeter', 'containerSpecification.hightInMeter', 'containerSpecification.lengthInMeter', 
            'containerSpecification.price', 'containerSpecification.createdAt', 'containerSpecification.updatedAt', 'containerSpecification.createdBy', 'containerSpecification.updatedBy', 'adminProfile1.userName as createdByUser',
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('containerSpecification.id = :specificationID')
            ->setParameter('specificationID', $specificationID)
            
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

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getContainerSpecificationPriceBySpecificationID($specificationID)
    {
        return $this->createQueryBuilder('containerSpecification')
            ->select('containerSpecification.price')

            ->andWhere('containerSpecification.id = :id')
            ->setParameter('id', $specificationID)

            ->getQuery()
            ->getOneOrNullResult();
    }

}
