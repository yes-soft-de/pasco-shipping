<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ReceiverEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\MarkEntity;
use App\Entity\SubcontractEntity;
use App\Entity\SubProductCategoryEntity;
use App\Entity\TrackEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentStatusEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentStatusEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentStatusEntity[]    findAll()
 * @method ShipmentStatusEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentStatusEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentStatusEntity::class);
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.isExternalWarehouse", 
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.externalWarehouseInfo",
            "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy as packeter", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode",
            "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "adminProfile1.userName as shipmentStatusCreatedByUser", 
            "adminProfile1.userName as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.userName as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", 
            "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", 
            "distributor.fullName as distributorName", "productCategory.name as productCategoryName", "markEntity.markNumber", "subcontractEntity.fullName as packetingBy", "subProductCategoryEntity.name as subProductCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipment.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.productCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = shipmentOrder.packetingBy'
            )

            ->orderBy('shipment.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber): ?ShipmentStatusEntity
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getShipmentsByStatusAndUserID($status, $userID)
    {
        $query = $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy", "shipmentOrder.holderType",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.isExternalWarehouse", 
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "shipmentOrder.externalWarehouseInfo", "shipmentOrder.markID",
                "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile2.userName as shipmentStatusUpdatedByUser",
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
                "productCategory.name as productCategoryName", "subProductCategoryEntity.name as subProductCategoryName")

            ->andWhere('shipment.shipmentStatus = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC');

        $this->addClientEntityJoinAndSelect($query);

        $this->addMarkEntityJoinAndSelect($query);

        $this->addReceiverEntityJoinAndSelect($query);

        $this->addAdminProfileEntityOneJoinAndSelect($query);

        return $query->getQuery()->getResult();
    }

    public function getUndeliveredShipmentsByUserID($userID)
    {
        $query = $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy", "shipmentOrder.holderType",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.isExternalWarehouse",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName",
                "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "productCategory.name as productCategoryName", "subProductCategoryEntity.name as subProductCategoryName")

            ->andWhere("shipment.shipmentStatus != 'delivered'")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC');

        $this->addClientEntityJoinAndSelect($query);

        $this->addMarkEntityJoinAndSelect($query);

        $this->addReceiverEntityJoinAndSelect($query);

        $this->addAdminProfileEntityOneJoinAndSelect($query);

        return $query->getQuery()->getResult();
    }

    public function getShipmentsByUserID($userID)
    {
        $query = $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy", "shipmentOrder.holderType",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.isExternalWarehouse",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "shipmentOrder.externalWarehouseInfo", "shipmentOrder.markID",
                "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName",
                "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "productCategory.name as productCategoryName", "subProductCategoryEntity.name as subProductCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC');

        $this->addClientEntityJoinAndSelect($query);

        $this->addMarkEntityJoinAndSelect($query);

        $this->addReceiverEntityJoinAndSelect($query);

        $this->addAdminProfileEntityOneJoinAndSelect($query);

        return $query->getQuery()->getResult();
    }

    public function getAllShipments()
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy", "shipmentOrder.isExternalWarehouse", 
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "clientProfile.identificationNumber as clientIdentificationNumber",
                "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.status",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser",
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", 
                "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "productCategory.name as productCategoryName", "subProductCategoryEntity.name as subProductCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipment.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipment.updatedBy'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentByTrackNumberAndUserID($trackNumber, $userID)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed", "shipmentOrder.isExternalWarehouse", 
                "shipmentOrder.clientUserID", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.createdAt as orderCreationDate", "shipmentOrder.externalWarehouseInfo", 
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.subProductCategoryID", "shipmentOrder.markID", "shipmentOrder.packetingBy as packetedBy", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "receiverEntity.phone as receiverPhoneNumber",
                "receiverEntity.fullName as receiverName", "distributor.fullName as distributorName", "importWarehouse.name as importWarehouseName", "productCategory.name as productCategoryName", "subcontract.fullName as packetingBy", "subProductCategoryEntity.name as subProductCategoryName")

            ->andWhere('shipmentStatus.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipmentStatus.shipmentID'
            )

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontract',
                Join::WITH,
                'subcontract.id = shipmentOrder.packetingBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierName",
                "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate", "shipmentOrder.isExternalWarehouse",
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy","shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.volume",
                "shipmentOrder.status", "track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.amount", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy",
                "adminProfile4.userName as trackCreatedByUser", "adminProfile4.image as trackCreatedByUserImage", "adminProfile5.userName as trackUpdatedByUser", "adminProfile5.image as trackUpdatedByUserImage", "clientProfile.userName as clientUsername",
                "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
                "productCategory.name as productCategoryName", "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere('shipmentStatus.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipmentStatus.shipmentID'
            )

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->leftJoin(
                TrackEntity::class,
                'track',
                Join::WITH,
                'track.shipmentID = shipmentStatus.shipmentID AND track.trackNumber = shipmentStatus.trackNumber'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentStatus.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentStatus.updatedBy'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile3',
                Join::WITH,
                'adminProfile3.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile4',
                Join::WITH,
                'adminProfile4.userID = track.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile5',
                Join::WITH,
                'adminProfile5.userID = track.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouse',
                Join::WITH,
                'exportWarehouse.id = shipmentOrder.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'importWarehouse',
                Join::WITH,
                'importWarehouse.id = shipmentOrder.importWarehouseID'
            )

            ->leftJoin(
                SubProductCategoryEntity::class,
                'subProductCategoryEntity',
                Join::WITH,
                'subProductCategoryEntity.id = shipmentOrder.subProductCategoryID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = subProductCategoryEntity.productCategoryID'
            )

            ->getQuery()
            ->getResult();
    }

    // For Check Holder API
    public function getShipmentOrderByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierName",
                "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate", "shipmentOrder.isExternalWarehouse",
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.subProductCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy","shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.volume",
                "shipmentOrder.status")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipmentStatus.shipmentID'
            )

            ->andWhere('shipmentStatus.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->getQuery()
            ->getResult();
    }

    public function getByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage")

            ->andWhere('shipmentStatus.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentStatus.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentStatus.updatedBy'
            )

            ->orderBy('shipmentStatus.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentStatusAndTracksByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "trackEntity.travelID", "trackEntity.holderType", "trackEntity.holderID", "trackEntity.amount")

            ->andWhere('shipmentStatus.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentStatus.shipmentID AND trackEntity.trackNumber = shipmentStatus.trackNumber'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentStatus.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentStatus.updatedBy'
            )

            ->orderBy('shipmentStatus.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentStatusAndTracksByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "trackEntity.travelID", "trackEntity.holderType", "trackEntity.holderID", "trackEntity.amount")

            ->andWhere('shipmentStatus.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('shipmentStatus.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentStatus.shipmentID AND trackEntity.trackNumber = shipmentStatus.trackNumber'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentStatus.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentStatus.updatedBy'
            )

            ->getQuery()
            ->getResult();
    }

    public function getByShipmentStatusAndShipmentID($shipmentStatus, $shipmentID)
    {
        return $this->createQueryBuilder('shipmentStatusEntity')
            ->select("shipmentStatusEntity.id", "shipmentStatusEntity.shipmentID", "shipmentStatusEntity.shipmentStatus", "shipmentStatusEntity.statusDetails", "shipmentStatusEntity.trackNumber", "shipmentStatusEntity.isInOneHolder", "shipmentStatusEntity.packed",
                "shipmentStatusEntity.createdAt", "shipmentStatusEntity.updatedAt", "shipmentStatusEntity.createdBy", "shipmentStatusEntity.updatedBy", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "trackEntity.travelID", "trackEntity.holderType", "trackEntity.holderID")

            ->andWhere('shipmentStatusEntity.shipmentStatus = :shipmentStatus')
            ->setParameter('shipmentStatus', $shipmentStatus)

            ->andWhere('shipmentStatusEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentStatusEntity.shipmentID AND trackEntity.trackNumber = shipmentStatusEntity.trackNumber'
            )
            
            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = shipmentStatusEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentStatusEntity.updatedBy'
            )

            ->orderBy('shipmentStatusEntity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function addClientEntityJoinAndSelect(QueryBuilder $queryBuilder)
    {
        return $queryBuilder->leftJoin(
            ClientProfileEntity::class,
            'clientProfile',
            Join::WITH,
            'clientProfile.userID = shipmentOrder.clientUserID'
        )
            ->addSelect("clientProfile.identificationNumber as clientIdentificationNumber", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage");
    }

    public function addMarkEntityJoinAndSelect(QueryBuilder $queryBuilder)
    {
        return $queryBuilder->leftJoin(
            MarkEntity::class,
            'markEntity',
            Join::WITH,
            'markEntity.id = shipmentOrder.markID'
        )
            ->addSelect("markEntity.markNumber");
    }

    public function addReceiverEntityJoinAndSelect(QueryBuilder $queryBuilder)
    {
        return $queryBuilder->leftJoin(
            ReceiverEntity::class,
            'receiverEntity',
            Join::WITH,
            'receiverEntity.id = shipmentOrder.receiverID'
        )
            ->addSelect("receiverEntity.phone as receiverPhoneNumber", "receiverEntity.fullName as receiverName");
    }

    public function addAdminProfileEntityOneJoinAndSelect(QueryBuilder $queryBuilder)
    {
        return $queryBuilder->leftJoin(
            AdminProfileEntity::class,
            'adminProfile1',
            Join::WITH,
            'adminProfile1.userID = shipment.createdBy'
        )
            ->addSelect("adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage");
    }

    public function deleteAllShipmentStatus()
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->delete()

            ->getQuery()
            ->getResult();
    }
    
}
