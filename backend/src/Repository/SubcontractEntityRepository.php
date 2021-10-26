<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\SubcontractServiceEntity;
use App\Entity\SubcontractEntity;
use App\Request\SubcontractFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SubcontractEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method SubcontractEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method SubcontractEntity[]    findAll()
 * @method SubcontractEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SubcontractEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SubcontractEntity::class);
    }

    public function getAllSubcontracts()
    {
        return $this->createQueryBuilder('subcontract')
            ->select('subcontract.id', 'subcontract.fullName', 'subcontract.phone', 'subcontract.serviceID', 'subcontract.createdAt', 'subcontract.updatedAt',
            'subcontract.createdBy', 'subcontract.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'servicesEntity.name as serviceName')

            ->leftJoin(
                SubcontractServiceEntity::class,
                'servicesEntity',
                Join::WITH,
                'servicesEntity.id = subcontract.serviceID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract.updatedBy'
            )

            ->orderBy('subcontract.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getSubcontractsByServiceID($serviceID)
    {
        return $this->createQueryBuilder('subcontract')
            ->select('subcontract.id', 'subcontract.fullName', 'subcontract.phone', 'subcontract.serviceID', 'subcontract.createdAt', 'subcontract.updatedAt',
            'subcontract.createdBy', 'subcontract.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
            'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'servicesEntity.name as serviceName')

            ->andWhere('subcontract.serviceID = :serviceID')
            ->setParameter('serviceID', $serviceID)
            
            ->leftJoin(
                SubcontractServiceEntity::class,
                'servicesEntity',
                Join::WITH,
                'servicesEntity.id = subcontract.serviceID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract.updatedBy'
            )

            ->orderBy('subcontract.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function filterSubcontracts(SubcontractFilterRequest $request)
    {
        $query = $this->createQueryBuilder('subcontract')
            ->select('subcontract.id', 'subcontract.fullName', 'subcontract.phone', 'subcontract.serviceID', 'subcontract.createdAt', 'subcontract.updatedAt',
                'subcontract.createdBy', 'subcontract.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage',
                'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage', 'servicesEntity.name as serviceName')

            ->leftJoin(
                SubcontractServiceEntity::class,
                'servicesEntity',
                Join::WITH,
                'servicesEntity.id = subcontract.serviceID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = subcontract.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = subcontract.updatedBy'
            )

            ->orderBy('subcontract.id', 'DESC');

        if($request->getFullName())
        {
            $name = $request->getFullName();

            $query->andWhere('subcontract.fullName LIKE :name');
            $query->setParameter('name', '%'.$name.'%');
        }

        if($request->getServiceID())
        {
            $query->andWhere('subcontract.serviceID = :serviceID');
            $query->setParameter('serviceID', $request->getServiceID());
        }

        if($request->getServiceName())
        {
            $serviceName = $request->getServiceName();

            $query->andWhere('servicesEntity.name LIKE :serviceName');
            $query->setParameter('serviceName', $serviceName);
        }

        return $query->getQuery()->getResult();
    }

}
