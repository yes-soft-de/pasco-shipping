<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\SubcontractServiceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SubcontractServiceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SubcontractServiceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SubcontractServiceEntity[]    findAll()
 * @method SubcontractServiceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SubcontractServiceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SubcontractServiceEntity::class);
    }

    public function getAllSubcontractServices()
    {
        return $this->createQueryBuilder('subcontract_service_entity')
            ->select('subcontract_service_entity.id', 'subcontract_service_entity.name', 'subcontract_service_entity.description', 'subcontract_service_entity.createdAt', 'subcontract_service_entity.updatedAt',
                'subcontract_service_entity.createdBy', 'subcontract_service_entity.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
            'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract_service_entity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract_service_entity.updatedBy'
            )

            ->orderBy('subcontract_service_entity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getSubcontractServiceById($id)
    {
        return $this->createQueryBuilder('subcontract_service_entity')
            ->select('subcontract_service_entity.id', 'subcontract_service_entity.name', 'subcontract_service_entity.description', 'subcontract_service_entity.createdAt', 'subcontract_service_entity.updatedAt',
                'subcontract_service_entity.createdBy', 'subcontract_service_entity.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
            'adminProfile2.image as updatedByUserImage')

            ->andWhere('subcontract_service_entity.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract_service_entity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract_service_entity.updatedBy'
            )

            ->orderBy('subcontract_service_entity.id', 'DESC')

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getSubcontractServiceByName($name)
    {
        return $this->createQueryBuilder('subcontract_service_entity')
            ->select('subcontract_service_entity.id', 'subcontract_service_entity.name', 'subcontract_service_entity.description', 'subcontract_service_entity.createdAt', 'subcontract_service_entity.updatedAt',
                'subcontract_service_entity.createdBy', 'subcontract_service_entity.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'adminProfile2.image as updatedByUserImage')

            ->andWhere('subcontract_service_entity.name LIKE :name')
            ->setParameter('name', '%'.$name.'%')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract_service_entity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract_service_entity.updatedBy'
            )

            ->orderBy('subcontract_service_entity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function deleteAllSubcontractsService()
    {
        return $this->createQueryBuilder('subcontract_service_entity')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}