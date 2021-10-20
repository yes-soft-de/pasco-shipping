<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use App\Entity\AirwaybillSpecificationEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\PortsEntity;
use App\Entity\ShipperEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
use App\Request\AirwaybillFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;
use function Doctrine\ORM\QueryBuilder;

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
            ->setMaxResults(100)

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillById($id)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.type', 'airwaybill.consigneeID', 'airwaybill.portID', 'airwaybill.location',
            'airwaybill.shipperID', 'airwaybill.providedBy', 'airwaybill.carrierID', 'airwaybill.createdBy', 'airwaybill.updatedBy', 'airwaybill.shipmentID', 'airwaybill.clientUserID', 'airwaybill.consignee', 'airwaybill.weight', 'airwaybill.shippingStatus',
                'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage', 'subcontractEntity.fullName as subcontractName',
            'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName', 'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage', 'portsEntity.name as portName')

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
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = airwaybill.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->leftJoin(
                PortsEntity::class,
                'portsEntity',
                Join::WITH,
                'portsEntity.id = airwaybill.portID'
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

    public function filterAirWaybills(AirwaybillFilterRequest $request)
    {
        // used variables for the isset() function
        $isRequested = $request->getIsRequested();
        $isExternalWarehouse = $request->getIsExternalWarehouse();
        $withoutNumber = $request->getWithoutNumber();

        $query = $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID', 'airwaybill.clientUserID', 'airwaybill.weight', 'airwaybill.exportWarehouseID',
                'airwaybill.shipmentID', 'airwaybill.createdBy', 'airwaybill.updatedBy', 'airwaybill.portID', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.consignee', 'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybill.location', 'airwaybill.shippingStatus',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName', 'clientProfileEntity.userName as clientUserName',
                'clientProfileEntity.image as clientUserImage', 'portsEntity.name as portName', 'exportWarehouseEntity.name as exportWarehouseName')

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
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = airwaybill.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->leftJoin(
                PortsEntity::class,
                'portsEntity',
                Join::WITH,
                'portsEntity.id = airwaybill.portID'
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

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = airwaybill.exportWarehouseID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(100);

        if($request->getId())
        {
            $query->andWhere('airwaybill.id = :id');
            $query->setParameter('id', $request->getId());
        }

        if($request->getAirwaybillNumber())
        {
            $query->andWhere('airwaybill.airwaybillNumber = :airwaybillNumber');
            $query->setParameter('airwaybillNumber', $request->getAirwaybillNumber());
        }

        if($withoutNumber)
        {
            $query->andWhere('airwaybill.airwaybillNumber = :airwaybillNumber');
            $query->setParameter('airwaybillNumber', "");
        }
        elseif(isset($withoutNumber) AND $withoutNumber == false)
        {
            $query->andWhere("airwaybill.airwaybillNumber != ''");
        }

        if($request->getStatus())
        {
            $query->andWhere('airwaybill.status = :status');
            $query->setParameter('status', $request->getStatus());
        }

        if($request->getType())
        {
            $query->andWhere('airwaybill.type = :type');
            $query->setParameter('type', $request->getType());
        }

        if($request->getProvidedBy())
        {
            $query->andWhere('airwaybill.providedBy = :providedBy');
            $query->setParameter('providedBy', $request->getProvidedBy());
        }

        if($request->getShipperID())
        {
            $query->andWhere('airwaybill.shipperID = :shipperID');
            $query->setParameter('shipperID', $request->getShipperID());
        }

        if($request->getConsigneeID())
        {
            $query->andWhere('airwaybill.consigneeID = :consigneeID');
            $query->setParameter('consigneeID', $request->getConsigneeID());
        }

        if($isExternalWarehouse)
        {
            $query->andWhere("orderShipmentEntity.isExternalWarehouse = :isExternalWarehouse");
            $query->setParameter('isExternalWarehouse', 1);
        }
        elseif (isset($isExternalWarehouse) AND $isExternalWarehouse == false)
        {
            $query->andWhere("airwaybill.shipmentID IS NULL");
        }

        if($request->getShipmentID())
        {
            $query->andWhere('airwaybill.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $request->getShipmentID());
        }

        if($request->getClientUserID())
        {
            $query->andWhere('airwaybill.clientUserID = :clientUserID');
            $query->setParameter('clientUserID', $request->getClientUserID());
        }

        if($request->getPortID())
        {
            $query->andWhere('airwaybill.portID = :portID');
            $query->setParameter('portID', $request->getPortID());
        }

        if($isRequested)
        {
            $query->andWhere('airwaybill.providedBy != :providedBy');
            $query->setParameter('providedBy', 0);
        }
        elseif(isset($isRequested) AND $isRequested == false)
        {
            $query->andWhere('airwaybill.providedBy = :providedBy');
            $query->setParameter('providedBy', 0);
        }

        return $query->getQuery()->getResult();
    }

    public function getAirwaybillByNumber($airwaybillNumber)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName')

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
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = airwaybill.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAirwaybillByShipperID($shipperID)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt', 'airwaybill.consigneeID',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName')

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
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = airwaybill.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
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
                'airwaybill.shipperID', 'airwaybill.carrierID', 'adminProfile2.userName as updatedByUserImage', 'airwaybill.providedBy', 'airwaybill.type', 'airwaybillSepcification.name as specificationName',
                'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName')

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
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = airwaybill.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = airwaybill.carrierID'
            )

            ->orderBy('airwaybill.id', 'DESC')
            ->setMaxResults(100)

            ->getQuery()
            ->getResult();
    }

    public function getProxyIdOfExportWarehouseByAirWaybillID($airWaybillID)
    {
        return $this->createQueryBuilder('airwaybill_entity')
            ->select('airwaybill_entity.exportWarehouseID', 'exportWarehouseEntity.proxyID as exportProxyID')

            ->andWhere('airwaybill_entity.id = :id')
            ->setParameter('id', $airWaybillID)

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = airwaybill_entity.exportWarehouseID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function deleteAllAirwaybills()
    {
        return $this->createQueryBuilder('airwaybill')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
