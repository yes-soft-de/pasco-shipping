<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\MarkEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\WarehouseEntity;
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
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo", 
            "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
            "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName")

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
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
            "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy as packeter", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo", 
            "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
            "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName",
             "markEntity.markNumber", "subcontractEntity.fullName as packetingBy")

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

            ->orderBy('shipmentOrder.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getWaitingShipmentsOrderByUserID($userID)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo", 
                "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "shipmentOrder.holderType",
                "markEntity.markNumber")

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
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getShipmentOrderById($id)
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.externalWarehouseInfo", 
                "shipmentOrder.isExternalWarehouse", "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "markEntity.markNumber")

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
                MarkEntity::class,
                'markEntity',
                Join::WITH,
                'markEntity.id = shipmentOrder.markID'
            )

            ->orderBy('shipmentOrder.id', 'DESC')

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterAcceptedShipments($transportationType, $isExternalWarehouse, $trackNumber, $shipmentStatus, $exportWarehouseName, $importWarehouseName, 
    $paymentTime, $launchCountry, $targetCountry)
    {
        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.volume",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "shipmentOrder.isExternalWarehouse", "shipmentOrder.externalWarehouseInfo", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
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

            ->orderBy('shipmentOrder.id', 'DESC');

            if($transportationType)
            {
                $query->andWhere('shipmentOrder.transportationType = :transportationType');
                $query->setParameter('transportationType', $transportationType);
            }

            if($trackNumber)
            {
                $query->leftJoin(
                    ShipmentStatusEntity::class,
                    'shipmentStatusEntity',
                    Join::WITH,
                    'shipmentStatusEntity.shipmentID = shipmentOrder.id'
                );

                $query->andWhere('shipmentStatusEntity.trackNumber = :trackNumber');
                $query->setParameter('trackNumber', $trackNumber);
            }

            if($shipmentStatus)
            {
                $query->andWhere('shipmentStatusEntity.shipmentStatus = :shipmentStatus');
                $query->setParameter('shipmentStatus', $shipmentStatus);
            }

            if(isset($isExternalWarehouse))
            {
                $query->andWhere('shipmentOrder.isExternalWarehouse = :isExternalWarehouse');
                $query->setParameter('isExternalWarehouse', $isExternalWarehouse);
            }

            if($exportWarehouseName)
            {
                $query->andWhere('exportWarehouse.name LIKE :exportWarehouseName');
                $query->setParameter('exportWarehouseName', '%'.$exportWarehouseName.'%');
            }

            if($importWarehouseName)
            {
                $query->andWhere('importWarehouse.name LIKE :importWarehouseName');
                $query->setParameter('importWarehouseName', '%'.$importWarehouseName.'%');
            }

            if($paymentTime)
            {
                $query->andWhere('shipmentOrder.paymentTime = :paymentTime');
                $query->setParameter('paymentTime', $paymentTime);
            }

            if($launchCountry)
            {
                $query->andWhere('countryEntity1.name = :launchCountry');
                $query->setParameter('launchCountry', $launchCountry);
            }

            if($targetCountry)
            {
                $query->andWhere('countryEntity2.name = :targetCountry');
                $query->setParameter('targetCountry', $targetCountry);
            }

            return $query->getQuery()->getResult();
    }

    public function filterWaitingShipmentsOrders($transportationType, $isExternalWarehouse, $exportWarehouseName, $paymentTime)
    {
        $query = $this->createQueryBuilder('shipmentOrder')
            ->select("shipmentOrder.id", "shipmentOrder.clientUserID", "shipmentOrder.transportationType", "shipmentOrder.target", "shipmentOrder.supplierID", "shipmentOrder.supplierName", "shipmentOrder.distributorID", "shipmentOrder.exportWarehouseID", "shipmentOrder.importWarehouseID", "shipmentOrder.quantity",
                "shipmentOrder.image", "shipmentOrder.createdAt", "shipmentOrder.updatedAt", "shipmentOrder.productCategoryID", "shipmentOrder.unit", "shipmentOrder.receiverName", "shipmentOrder.receiverPhoneNumber", "shipmentOrder.markID", "shipmentOrder.packetingBy", "shipmentOrder.paymentTime", "shipmentOrder.volume",
                "shipmentOrder.weight", "shipmentOrder.qrCode", "shipmentOrder.guniQuantity", "shipmentOrder.isExternalWarehouse", "shipmentOrder.externalWarehouseInfo", "shipmentOrder.updatedBy", "shipmentOrder.vehicleIdentificationNumber", "shipmentOrder.extraSpecification", "shipmentOrder.status", "clientProfile.userName as clientUsername", "clientProfile.image as clientUserImage",
                "adminProfile.userName as orderUpdatedByUser", "adminProfile.image as orderUpdatedByUserImage", "productCategory.name as productCategoryName", "distributor.fullName as distributorName", "exportWarehouse.name as exportWarehouseName", "importWarehouse.name as importWarehouseName", "markEntity.markNumber")

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

            if($exportWarehouseName)
            {
                $query->andWhere('exportWarehouse.name LIKE :exportWarehouseName');
                $query->setParameter('exportWarehouseName', '%'.$exportWarehouseName.'%');
            }

            if($paymentTime)
            {
                $query->andWhere('shipmentOrder.paymentTime = :paymentTime');
                $query->setParameter('paymentTime', $paymentTime);
            }
            // dd($query->getQuery()->getResult());
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

    public function deleteAllOrders()
    {
        return $this->createQueryBuilder('shipmentOrder')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
