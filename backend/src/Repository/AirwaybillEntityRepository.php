<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use App\Entity\AirwaybillSpecificationEntity;
use App\Entity\SubcontractEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillEntity[]    findAll()
 * @method AirwaybillEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillEntity::class);
    }

    public function getAirwaybillsByStatus($status)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillById($id)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.type', 'airwaybill.consigneeID',
            'airwaybill.shipperID', 'airwaybill.providedBy', 'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 
             'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 
             'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAirwaybillsByType($type)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.type = :type')
            ->setParameter('type', $type)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillsByConsigneeID($consigneeID)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.consigneeID = :consigneeID')
            ->setParameter('consigneeID', $consigneeID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillByNumber($airwaybillNumber)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.airwaybillNumber = :airwaybillNumber')
            ->setParameter('airwaybillNumber', $airwaybillNumber)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillsByShipperID($shipperID)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.shipperID = :shipperID')
            ->setParameter('shipperID', $shipperID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillsByProvidedBy($providedBy)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.providedBy = :providedBy')
            ->setParameter('providedBy', $providedBy)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillsBySpecificationID($specificationID)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.weight',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName')

            ->andWhere('airwaybill.specificationID = :specificationID')
            ->setParameter('specificationID', $specificationID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->leftJoin(
                AirwaybillSpecificationEntity::class,
                'airwaybillSepcification',
                Join::WITH,
                'airwaybillSepcification.id = airwaybill.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = airwaybill.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = airwaybill.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = airwaybill.shipperID'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
