<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use App\Entity\AirwaybillSpecificationEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\OrderShipmentEntity;
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
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.name as specificationName',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(30)

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillById($id)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.type', 'airwaybill.consigneeID',
            'airwaybill.shipperID', 'airwaybill.providedBy', 'airwaybill.carrierID', 'airwaybill.createdBy', 'airwaybill.updatedBy', 'airwaybillSepcification.name as specificationName', 'airwaybill.shipmentID', 'airwaybill.clientUserID',
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage', 'subcontractEntity.fullName as subcontractName',
            'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName',
            'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = airwaybill.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = airwaybill.clientUserID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterAirWaybills($specificationID, $airwaybillNumber, $status, $type, $providedBy, $shipperID, $consigneeID,
                                      $isExternalWarehouse, $shipmentID, $clientUserID)
    {
        $query = $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID', 'airwaybill.clientUserID',
                'airwaybill.shipmentID', 'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.name as specificationName',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName',
                'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = airwaybill.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = airwaybill.clientUserID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(30);

        if($specificationID)
        {
            $query->andWhere('airwaybill.specificationID = :specificationID');
            $query->setParameter('specificationID', $specificationID);
        }

        if($airwaybillNumber)
        {
            $query->andWhere('airwaybill.airwaybillNumber = :airwaybillNumber');
            $query->setParameter('airwaybillNumber', $airwaybillNumber);
        }

        if($status)
        {
            $query->andWhere('airwaybill.status = :status');
            $query->setParameter('status', $status);
        }

        if($type)
        {
            $query->andWhere('airwaybill.type = :type');
            $query->setParameter('type', $type);
        }

        if($providedBy)
        {
            $query->andWhere('airwaybill.providedBy = :providedBy');
            $query->setParameter('providedBy', $providedBy);
        }

        if($shipperID)
        {
            $query->andWhere('airwaybill.shipperID = :shipperID');
            $query->setParameter('shipperID', $shipperID);
        }

        if($consigneeID)
        {
            $query->andWhere('airwaybill.consigneeID = :consigneeID');
            $query->setParameter('consigneeID', $consigneeID);
        }

        if($isExternalWarehouse == true)
        {
            $query->andWhere("orderShipmentEntity.isExternalWarehouse = 1");
        }
        elseif (isset($isExternalWarehouse) AND $isExternalWarehouse == false)
        {
            $query->andWhere("airwaybill.shipmentID IS NULL");
        }

        if($shipmentID)
        {
            $query->andWhere('airwaybill.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($clientUserID)
        {
            $query->andWhere('airwaybill.clientUserID = :clientUserID');
            $query->setParameter('clientUserID', $clientUserID);
        }

        return $query->getQuery()->getResult();
    }

    public function getAirwaybillByNumber($airwaybillNumber)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.name as specificationName',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(30)

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillsBySpecificationID($specificationID)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.name as specificationName',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(30)

            ->getQuery()
            ->getResult();
    }

    public function deleteAllAirwaybills()
    {
        return $this->createQueryBuilder('airwaybill')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
