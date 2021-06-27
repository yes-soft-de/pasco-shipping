<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\TrackEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
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

    public function getUnPackedShipments()
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", 
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", 
            "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", 
            "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", 
            "clientProfile.image as clientUserImage", "adminProfile.userName as shipmentStatusCreatedByUser", "adminProfile.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as orderUpdatedByUser", 
            "adminProfile2.image as orderUpdatedByUserImage", "distributor.fullName as distributorName", "productCategory.name as productCategoryName", "exportWarehouse.city as exportWarehouseCity", "importWarehouse.city as importWarehouseCity")

            ->andWhere('shipment.packed = :packed')
            ->setParameter('packed', 0)

            ->andWhere("shipment.shipmentStatus = 'received'")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = shipmentOrder.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile',
                Join::WITH,
                'adminProfile.userID = shipment.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = shipmentOrder.updatedBy'
            )

            ->leftJoin(
                DistributorEntity::class,
                'distributor',
                Join::WITH,
                'distributor.id = shipmentOrder.distributorID'
            )

            ->leftJoin(
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
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

            ->orderBy('shipment.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getShipmentsByTransportationType($transportationType)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", 
            "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", 
            "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "adminProfile1.userName as shipmentStatusCreatedByUser", 
            "adminProfile1.userName as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.userName as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", 
            "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "exportWarehouse.city as exportWarehouseCity", "importWarehouse.city as importWarehouseCity", 
            "distributor.fullName as distributorName", "productCategory.name as productCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
            )

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
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
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
                "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser", 
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "userProfile.userName as clientUsername", "userProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", 
                "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity", "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

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
                'userProfile',
                Join::WITH,
                'userProfile.userID = shipmentOrder.clientUserID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentsByUserID($userID)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
                "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser",
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "userProfile.userName as clientUsername", "userProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage",
                "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity", "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

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
                'userProfile',
                Join::WITH,
                'userProfile.userID = shipmentOrder.clientUserID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAllShipments()
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
                "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.status",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser",
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", 
                "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity", "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function filterShipmentsByStatusAndPaymentTimeAndTransportationType($status, $paymentTime, $transportationType)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
                "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
                "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
                "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy",
                "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser", 
                "adminProfile2.image as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity",
                "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->andWhere('shipment.shipmentStatus = :status')
            ->setParameter('status', $status)

            ->andWhere('shipmentOrder.paymentTime = :paymentTime')
            ->setParameter('paymentTime', $paymentTime)

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function filterShipmentsByStatusAndPaymentTimeAndTransportationTypeAndCreationDate($status, $paymentTime, $transportationType, $createdAt)
    {
        return $this->createQueryBuilder('shipment')
            ->select("shipment.id", "shipment.shipmentID", "shipment.shipmentStatus", "shipment.trackNumber", "shipment.statusDetails", "shipment.isInOneHolder", "shipment.packed", "shipment.createdBy", "shipment.updatedBy",
            "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID",
            "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName",
            "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy",
            "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage", "adminProfile2.userName as shipmentStatusUpdatedByUser", 
            "adminProfile2.image as shipmentStatusUpdatedByUserImage", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.city as exportWarehouseCity",
            "importWarehouse.city as importWarehouseCity", "productCategory.name as productCategoryName")

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipment.shipmentID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->andWhere('shipment.shipmentStatus = :status')
            ->setParameter('status', $status)

            ->andWhere('shipmentOrder.paymentTime = :paymentTime')
            ->setParameter('paymentTime', $paymentTime)

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->andWhere('shipmentOrder.createdAt >= :createdAt')
            ->setParameter('createdAt', $createdAt)

            ->orderBy('shipment.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentByTrackNumberAndUserID($trackNumber, $userID)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierName",
                "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate",
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy",
                "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification",
                "shipmentOrder.status", "track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy",
                "adminProfile4.userName as trackCreatedByUser", "adminProfile5.userName as trackUpdatedByUser", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser",
                "adminProfile1.userName as shipmentStatusCreatedBy", "adminProfile2.userName as shipmentStatusUpdatedBy", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
                "productCategory.name as productCategoryName")

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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->getQuery()
            ->getResult();
    }

    public function getShipmentByTrackNumber($trackNumber)
    {
        return $this->createQueryBuilder('shipmentStatus')
            ->select("shipmentStatus.id", "shipmentStatus.shipmentID", "shipmentStatus.shipmentStatus", "shipmentStatus.statusDetails", "shipmentStatus.trackNumber", "shipmentStatus.isInOneHolder", "shipmentStatus.packed",
                "shipmentStatus.createdAt", "shipmentStatus.updatedAt", "shipmentStatus.createdBy", "shipmentStatus.updatedBy", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierName",
                "shipmentOrder.supplierID", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.image", "shipmentOrder.createdAt as orderCreationDate",
                "shipmentOrder.updatedAt as orderUpdatingDate", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy",
                "shipmentOrder.paymentTime", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification",
                "shipmentOrder.status", "track.id", "track.shipmentID", "track.trackNumber", "track.travelID", "track.holderType", "track.holderID", "track.createdAt", "track.updatedAt", "track.createdBy", "track.updatedBy",
                "adminProfile4.userName as trackCreatedByUser", "adminProfile4.image as trackCreatedByUserImage", "adminProfile5.userName as trackUpdatedByUser", "adminProfile5.image as trackUpdatedByUserImage", "clientProfile.userName as clientUsername",
                "clientProfile.image as clientUserImage", "adminProfile3.userName as orderUpdatedByUser", "adminProfile3.image as orderUpdatedByUserImage", "adminProfile1.userName as shipmentStatusCreatedByUser", "adminProfile1.image as shipmentStatusCreatedByUserImage",
                "adminProfile2.userName as shipmentStatusUpdatedByUser", "adminProfile2.image as shipmentStatusUpdatedByUserImage", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
                "productCategory.name as productCategoryName")

            ->andWhere('shipmentStatus.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                OrderShipmentEntity::class,
                'shipmentOrder',
                Join::WITH,
                'shipmentOrder.id = shipmentStatus.shipmentID'
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
                ProductCategoryEntity::class,
                'productCategory',
                Join::WITH,
                'productCategory.id = shipmentOrder.productCategoryID'
            )

            ->getQuery()
            ->getResult();
    }
    
}
