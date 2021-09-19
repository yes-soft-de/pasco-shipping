<?php

namespace App\Repository;

use App\Constant\HolderTypeConstant;
use App\Constant\ShipmentStatusConstant;
use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\MarkEntity;
use App\Entity\ReceiverEntity;
use App\Entity\ShipmentLogEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\SubProductCategoryEntity;
use App\Entity\TrackEntity;
use App\Entity\WarehouseEntity;
use App\Request\ShipmentFilterRequest;
use DateInterval;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method OrderShipmentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderShipmentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderShipmentEntity[]    findAll()
 * @method OrderShipmentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderShipmentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderShipmentEntity::class);
    }

    public function getShipmentsOrdersByStatus($status)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.receiverID",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo",
            "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
            "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "subProductCategoryEntity.name as subProductCategoryName",
                "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere('shipmentOrder.status = :state')
            ->setParameter('state', $status)

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getAllAcceptedShipmentsOrders()
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.isExternalWarehouse", "shipmentOrder.externalWarehouseInfo", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "markEntity.markNumber")

            ->andWhere("shipmentOrder.status = 'accepted'")
            
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
                'adminProfile.userID = shipmentOrder.updatedBy'
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

            ->leftJoin(
                CountryEntity::class,
                'countryEntity1',
                Join::WITH,
                'countryEntity1.id = exportWarehouse.countryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity2',
                Join::WITH,
                'countryEntity2.id = importWarehouse.countryID'
            )

            ->leftJoin(
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentsOrdersByTransportationTypeAndStatus($transportationType, $status)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.receiverID",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy as packeter", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo",
            "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
            "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
             "markEntity.markNumber", "subcontractEntity.fullName as packetingBy", "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere("shipmentOrder.status = :status")
            ->setParameter('status', $status)

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getWaitingShipmentsOrderByUserID($userID)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.receiverID",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "shipmentOrder.holderType", "shipmentOrder.holderCount",
                "markEntity.markNumber", "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere('shipmentOrder.clientUserID = :userID')
            ->setParameter('userID', $userID)

            ->andWhere("shipmentOrder.status = 'waiting'")

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentOrderById($id)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.holderType", "shipmentOrder.quantity", "shipmentOrder.receiverID",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo",
                "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "shipmentOrder.holderCount", "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "markEntity.markNumber",
                 "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere('shipmentOrder.id = :id')
            ->setParameter('id', $id)

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterAcceptedShipments(ShipmentFilterRequest $request, $containerID, $airWaybillID)
    {
        // variable is used for the isset() function later
        $isExternalWarehouse = $request->getIsExternalWarehouse();

        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("DISTINCT(shipmentOrder.id) as id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.receiverID",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.volume", "shipmentOrder.holderType",
                "shipmentOrder.holderCount", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "shipmentOrder.isExternalWarehouse", "shipmentOrder.externalWarehouseInfo", "clientProfile.userName as clientUsername",
                "clientProfile.image as clientUserImage", "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", 
                "markEntity.markNumber", "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber", "CONCAT(productCategory.name, ' / ', subProductCategoryEntity.name) as categoriesNames")

            ->andWhere("shipmentOrder.status = 'accepted'")
            
            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.shipmentID = shipmentOrder.id'
            )

            ->leftJoin(
                TrackEntity::class,
                'trackEntity',
                Join::WITH,
                'trackEntity.shipmentID = shipmentOrder.id AND trackEntity.trackNumber = shipmentStatusEntity.trackNumber'
            )
            
            ->leftJoin(
                ShipmentLogEntity::class,
                'shipmentLogEntity',
                Join::WITH,
                'shipmentLogEntity.shipmentID = shipmentOrder.id'
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
                'adminProfile.userID = shipmentOrder.updatedBy'
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
                CountryEntity::class,
                'countryEntity1',
                Join::WITH,
                'countryEntity1.id = exportWarehouse.countryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity2',
                Join::WITH,
                'countryEntity2.id = importWarehouse.countryID'
            )

            ->leftJoin(
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC');

            if($request->getTransportationType())
            {
                $query->andWhere('shipmentOrder.transportationType = :transportationType');
                $query->setParameter('transportationType', $request->getTransportationType());
            }

            if($request->getTrackNumber())
            {
                $query->andWhere('shipmentStatusEntity.trackNumber = :trackNumber');
                $query->setParameter('trackNumber', $request->getTrackNumber());
            }

            if($request->getStatus() && $request->getDateOne() == null && $request->getDateTwo() == null)
            {
                $query->andWhere('shipmentStatusEntity.shipmentStatus = :shipmentStatus');
                $query->setParameter('shipmentStatus', $request->getStatus());
            }

            if(isset($isExternalWarehouse))
            {
                $query->andWhere('shipmentOrder.isExternalWarehouse = :isExternalWarehouse');
                $query->setParameter('isExternalWarehouse', $isExternalWarehouse);
            }

            if($request->getExportWarehouseID())
            {
                $query->andWhere('shipmentOrder.exportWarehouseID = :exportWarehouseID');
                $query->setParameter('exportWarehouseID', $request->getExportWarehouseID());
            }

            if($request->getImportWarehouseID())
            {
                $query->andWhere('shipmentOrder.importWarehouseID = :importWarehouseID');
                $query->setParameter('importWarehouseID', $request->getImportWarehouseID());
            }

            if($request->getPaymentTime())
            {
                $query->andWhere('shipmentOrder.paymentTime = :paymentTime');
                $query->setParameter('paymentTime', $request->getPaymentTime());
            }

            if($request->getLaunchCountry())
            {
                $query->andWhere('countryEntity1.name = :launchCountry');
                $query->setParameter('launchCountry', $request->getLaunchCountry());
            }

            if($request->getTargetCountry())
            {
                $query->andWhere('countryEntity2.name = :targetCountry');
                $query->setParameter('targetCountry', $request->getTargetCountry());
            }

            if($request->getDateOne() != null && $request->getDateOne() != null && $request->getStatus() != null)
            {
                $query->andWhere('shipmentLogEntity.createdAt BETWEEN :dateOne AND :dateTwo');
                $query->setParameter('dateOne', $request->getDateOne());
                $query->setParameter('dateTwo', $request->getDateOne());

                $query->andWhere('shipmentLogEntity.shipmentStatus = :shipmentStatus');
                $query->setParameter('shipmentStatus', $request->getStatus());
            }

            if($request->getDateOne() != null && $request->getDateOne() == null && $request->getStatus() != null)
            {
                $query->andWhere('shipmentLogEntity.createdAt BETWEEN :dateOne AND :dateTwo');
                $query->setParameter('dateOne', $request->getDateOne());
                $query->setParameter('dateTwo', (new \DateTime($request->getDateOne()))->modify('+1 day')->format('Y-m-d'));

                $query->andWhere('shipmentLogEntity.shipmentStatus = :shipmentStatus');
                $query->setParameter('shipmentStatus', $request->getStatus());
            }

            if($request->getDateOne() == null && $request->getDateOne() != null && $request->getStatus() != null)
            {
                $query->andWhere('shipmentLogEntity.createdAt BETWEEN :dateTwo AND :dateThree');
                $query->setParameter('dateTwo', $request->getDateOne());
                $query->setParameter('dateThree', (new \DateTime($request->getDateOne()))->modify('+1 day')->format('Y-m-d'));

                $query->andWhere('shipmentLogEntity.shipmentStatus = :shipmentStatus');
                $query->setParameter('shipmentStatus', $request->getStatus());
            }

            if($containerID)
            {
                $query->andWhere("trackEntity.holderType = :holderType AND trackEntity.holderID = :containerID");

                $query->setParameter('holderType', HolderTypeConstant::$CONTAINER_HOLDER_TYPE);
                $query->setParameter('containerID', $containerID);
            }

            if($airWaybillID)
            {
                $query->andWhere("trackEntity.holderType = :holderType AND trackEntity.holderID = :airWaybillID");

                $query->setParameter('holderType', HolderTypeConstant::$AIRWAYBILL_HOLDER_TYPE);
                $query->setParameter('airWaybillID', $airWaybillID);
            }

            if($request->getClientUserID())
            {
                $query->andWhere('shipmentOrder.clientUserID = :clientUserID');
                $query->setParameter('clientUserID', $request->getClientUserID());
            }

            if($request->getMeasuredUntilCleared())
            {
                $query->andWhere("(shipmentStatusEntity.shipmentStatus = :shipmentStatus OR shipmentStatusEntity.shipmentStatus = :shipmentStatus2 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus3 OR
                    shipmentStatusEntity.shipmentStatus = :shipmentStatus4 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus5 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus6)");

                $query->setParameter('shipmentStatus', ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus2', ShipmentStatusConstant::$STORED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus3', ShipmentStatusConstant::$UPLOADED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus4', ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus5', ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus6', ShipmentStatusConstant::$CLEARED_SHIPMENT_STATUS);
            }

            if($request->getMeasuredUntilArrived())
            {
                $query->andWhere("(shipmentStatusEntity.shipmentStatus = :shipmentStatus OR shipmentStatusEntity.shipmentStatus = :shipmentStatus2 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus3 OR
                        shipmentStatusEntity.shipmentStatus = :shipmentStatus4 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus5 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus6
                         OR shipmentStatusEntity.shipmentStatus = :shipmentStatus7)");

                $query->setParameter('shipmentStatus', ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus2', ShipmentStatusConstant::$STORED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus3', ShipmentStatusConstant::$UPLOADED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus4', ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus5', ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus6', ShipmentStatusConstant::$CLEARED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus7', ShipmentStatusConstant::$ARRIVED_SHIPMENT_STATUS);
            }

            if($request->getAcceptedUntilCleared())
            {
                $query->andWhere("(shipmentStatusEntity.shipmentStatus = :shipmentStatus OR shipmentStatusEntity.shipmentStatus = :shipmentStatus2 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus3 OR
                            shipmentStatusEntity.shipmentStatus = :shipmentStatus4 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus5 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus6
                             OR shipmentStatusEntity.shipmentStatus = :shipmentStatus7 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus8)");

                $query->setParameter('shipmentStatus', ShipmentStatusConstant::$ACCEPTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus2', ShipmentStatusConstant::$RECEIVED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus3', ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus4', ShipmentStatusConstant::$STORED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus5', ShipmentStatusConstant::$UPLOADED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus6', ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus7', ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus8', ShipmentStatusConstant::$CLEARED_SHIPMENT_STATUS);
            }

            if($request->getAcceptedUntilArrived())
            {
                $query->andWhere("(shipmentStatusEntity.shipmentStatus = :shipmentStatus OR shipmentStatusEntity.shipmentStatus = :shipmentStatus2 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus3 OR
                                shipmentStatusEntity.shipmentStatus = :shipmentStatus4 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus5 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus6
                                 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus7 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus8 OR shipmentStatusEntity.shipmentStatus = :shipmentStatus9)");

                $query->setParameter('shipmentStatus', ShipmentStatusConstant::$ACCEPTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus2', ShipmentStatusConstant::$RECEIVED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus3', ShipmentStatusConstant::$MEASURED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus4', ShipmentStatusConstant::$STORED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus5', ShipmentStatusConstant::$UPLOADED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus6', ShipmentStatusConstant::$STARTED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus7', ShipmentStatusConstant::$RELEASED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus8', ShipmentStatusConstant::$CLEARED_SHIPMENT_STATUS);

                $query->setParameter('shipmentStatus9', ShipmentStatusConstant::$ARRIVED_SHIPMENT_STATUS);
            }

            return $query->getQuery()->getResult();
    }

    public function getShipmentsByTransportationTypeAndShipmentStatusAndWarehouseTypeAndWarehousesIDs($transportationType, $shipmentStatus, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID)
    {
        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.transportationType")

            ->andWhere("shipmentOrder.status = 'accepted'")

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.shipmentID = shipmentOrder.id'
            )

            ->orderBy('shipmentOrder.id', 'DESC');

        if($exportWarehouseID)
        {
            $query->andWhere('shipmentOrder.exportWarehouseID = :exportWarehouseID');
            $query->setParameter('exportWarehouseID', $exportWarehouseID);
        }

        if($importWarehouseID)
        {
            $query->andWhere('shipmentOrder.importWarehouseID = :importWarehouseID');
            $query->setParameter('importWarehouseID', $importWarehouseID);
        }

        if(isset($isExternalWarehouse))
        {
            $query->andWhere('shipmentOrder.isExternalWarehouse = :isExternalWarehouse');
            $query->setParameter('isExternalWarehouse', $isExternalWarehouse);
        }

        if($shipmentStatus)
        {
            $query->andWhere('shipmentStatusEntity.shipmentStatus = :shipmentStatus');
            $query->setParameter('shipmentStatus', $shipmentStatus);
        }

        return $query->getQuery()->getResult();
    }

    public function getShipmentsByTransportationTypeAndWarehouseTypeAndWarehousesIDsAndNotDelivered($transportationType, $isExternalWarehouse, $exportWarehouseID, $importWarehouseID)
    {
        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.transportationType")

            ->andWhere("shipmentOrder.status = 'accepted'")

            ->andWhere('shipmentOrder.transportationType = :transportationType')
            ->setParameter('transportationType', $transportationType)

            ->leftJoin(
                ShipmentStatusEntity::class,
                'shipmentStatusEntity',
                Join::WITH,
                'shipmentStatusEntity.shipmentID = shipmentOrder.id'
            )

            ->andWhere("shipmentStatusEntity.shipmentStatus != 'accepted'")
            ->andWhere("shipmentStatusEntity.shipmentStatus != 'received'")
            ->andWhere("shipmentStatusEntity.shipmentStatus != 'delivered'")

            ->orderBy('shipmentOrder.id', 'DESC');

        if($exportWarehouseID)
        {
            $query->andWhere('shipmentOrder.exportWarehouseID = :exportWarehouseID');
            $query->setParameter('exportWarehouseID', $exportWarehouseID);
        }

        if($importWarehouseID)
        {
            $query->andWhere('shipmentOrder.importWarehouseID = :importWarehouseID');
            $query->setParameter('importWarehouseID', $importWarehouseID);
        }

        if(isset($isExternalWarehouse))
        {
            $query->andWhere('shipmentOrder.isExternalWarehouse = :isExternalWarehouse');
            $query->setParameter('isExternalWarehouse', $isExternalWarehouse);
        }

        return $query->getQuery()->getResult();
    }

    public function filterWaitingShipmentsOrders($transportationType, $isExternalWarehouse, $exportWarehouseID, $paymentTime)
    {
        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity", "shipmentOrder.receiverID", "shipmentOrder.holderCount",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "receiverEntity.fullName as receiverName", "receiverEntity.phone as receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.volume", "shipmentOrder.holderType",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.isExternalWarehouse", "shipmentOrder.externalWarehouseInfo", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", 
                "clientProfile.image as clientUserImage", "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", 
                "markEntity.markNumber", "subProductCategoryEntity.name as subProductCategoryName", "clientProfile.identificationNumber as clientIdentificationNumber")

            ->andWhere("shipmentOrder.status = 'waiting'")
            
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
                'adminProfile.userID = shipmentOrder.updatedBy'
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
                CountryEntity::class,
                'countryEntity1',
                Join::WITH,
                'countryEntity1.id = exportWarehouse.countryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity2',
                Join::WITH,
                'countryEntity2.id = importWarehouse.countryID'
            )

            ->leftJoin(
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->leftJoin(
                ReceiverEntity::class,
                'receiverEntity',
                Join::WITH,
                'receiverEntity.id = shipmentOrder.receiverID'
            )

            ->orderBy('shipmentOrder.id', 'DESC');

            if($transportationType)
            {
                $query->andWhere('shipmentOrder.transportationType = :transportationType');
                $query->setParameter('transportationType', $transportationType);
            }

            if(isset($isExternalWarehouse))
            {
                $query->andWhere('shipmentOrder.isExternalWarehouse = :isExternalWarehouse');
                $query->setParameter('isExternalWarehouse', $isExternalWarehouse);
            }

            if($exportWarehouseID)
            {
                $query->andWhere('exportWarehouse.id = :exportWarehouseID');
                $query->setParameter('exportWarehouseID', $exportWarehouseID);
            }

            if($paymentTime)
            {
                $query->andWhere('shipmentOrder.paymentTime = :paymentTime');
                $query->setParameter('paymentTime', $paymentTime);
            }

            return $query->getQuery()->getResult();
    }

    public function getShipmentOrderByMarkID($markID)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName")

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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

            ->leftJoin(
                CountryEntity::class,
                'countryEntity1',
                Join::WITH,
                'countryEntity1.id = exportWarehouse.countryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity2',
                Join::WITH,
                'countryEntity2.id = importWarehouse.countryID'
            )

            ->andWhere('shipmentOrder.markID = :markID')
            ->setParameter('markID', $markID)

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentOrderByReceiver($receiverID)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverID", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName")

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
                'adminProfile.userID = shipmentOrder.updatedBy'
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

            ->leftJoin(
                CountryEntity::class,
                'countryEntity1',
                Join::WITH,
                'countryEntity1.id = exportWarehouse.countryID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity2',
                Join::WITH,
                'countryEntity2.id = importWarehouse.countryID'
            )

            ->andWhere('shipmentOrder.receiverID = :receiverID')
            ->setParameter('receiverID', $receiverID)

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentOrderByDistributor($distributorID)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.distributorID")

            ->andWhere('shipmentOrder.distributorID = :distributorID')
            ->setParameter('distributorID', $distributorID)

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function deleteAllOrders()
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
