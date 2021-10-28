<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ContainerEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\CountryEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\PortsEntity;
use App\Entity\ShipperEntity;
use App\Entity\SubcontractEntity;
use App\Entity\TrackEntity;
use App\Entity\WarehouseEntity;
use App\Request\ContainerFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;
use function Doctrine\ORM\QueryBuilder;

/**
 * @method ContainerEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContainerEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContainerEntity[]    findAll()
 * @method ContainerEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContainerEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContainerEntity::class);
    }

    public function getByStatus($status)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID', 'container.carrierID',
            'container.shipperID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

            ->andWhere('container.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->orderBy('container.id', 'DESC')
            ->setMaxResults(100)
            
            ->getQuery()
            ->getResult();
    }

    public function getContainerById($id)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID', 'container.createdBy', 'container.carrierID', 'container.exportPortID',
                'container.exportLocation', 'container.shipperID', 'container.type', 'container.providedBy', 'container.shipmentID', 'container.portID', 'container.location', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'container.consignee', 'container.exportCity', 'container.exportCountryID', 'adminProfile2.userName as updatedByUserImage', 'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName',
                'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName', 'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage', 'container.clientUserID', 'portsEntity.name as portName', 'exportPortsEntity.name as exportPortName', 'container.shippingStatus',
                'countryEntity.name as exportCountryName', 'exportWarehouseEntity.name as exportLocationName')

            ->andWhere('container.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = container.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->leftJoin(
                PortsEntity::class,
                'portsEntity',
                Join::WITH,
                'portsEntity.id = container.portID'
            )

            ->leftJoin(
                PortsEntity::class,
                'exportPortsEntity',
                Join::WITH,
                'exportPortsEntity.id = container.exportPortID'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = container.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = container.clientUserID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity',
                Join::WITH,
                'countryEntity.id = container.exportCountryID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = container.exportLocation'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterContainers(ContainerFilterRequest $request)
    {
        // used variables for the isset() function
        $isRequested = $request->getIsRequested();
        $isExternalWarehouse = $request->getIsExternalWarehouse();
        $withoutNumber = $request->getWithoutNumber();

        $query = $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID', 'container.shipmentID', 'container.clientUserID', 'container.consignee', 'container.exportLocation',
                'container.exportPortID', 'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'container.portID', 'container.location', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
                'container.shippingStatus', 'container.exportCity', 'container.exportCountryID', 'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName',
                'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage', 'portsEntity.name as portName', 'countryEntity.name as exportCountryName', 'container.exportWarehouseID', 'exportWarehouseEntity.name as exportWarehouseName', 'exportWarehouseEntityTwo.name as exportLocationName',
                'exportPortsEntity.name as exportPortName')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = container.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->leftJoin(
                PortsEntity::class,
                'portsEntity',
                Join::WITH,
                'portsEntity.id = container.portID'
            )

            ->leftJoin(
                PortsEntity::class,
                'exportPortsEntity',
                Join::WITH,
                'exportPortsEntity.id = container.exportPortID'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = container.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = container.clientUserID'
            )

            ->leftJoin(
                CountryEntity::class,
                'countryEntity',
                Join::WITH,
                'countryEntity.id = container.exportCountryID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = container.exportWarehouseID'
            )

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntityTwo',
                Join::WITH,
                'exportWarehouseEntityTwo.id = container.exportLocation'
            )

            ->orderBy('container.id', 'DESC')
            ->setMaxResults(100);

        if($request->getId())
        {
            $query->andWhere('container.id = :id');
            $query->setParameter('id', $request->getId());
        }
        
        if($request->getSpecificationID())
        {
            $query->andWhere('container.specificationID = :specificationID');
            $query->setParameter('specificationID', $request->getSpecificationID());
        }

        if($request->getContainerNumber())
        {
            $query->andWhere('container.containerNumber = :containerNumber');
            $query->setParameter('containerNumber', $request->getContainerNumber());
        }

        if($request->getStatus())
        {
            $query->andWhere('container.status = :status');
            $query->setParameter('status', $request->getStatus());
        }

        if($request->getType())
        {
            $query->andWhere('container.type = :type');
            $query->setParameter('type', $request->getType());
        }

        if($request->getProvidedBy())
        {
            $query->andWhere('container.providedBy = :providedBy');
            $query->setParameter('providedBy', $request->getProvidedBy());
        }

        if($request->getShipperID())
        {
            $query->andWhere('container.shipperID = :shipperID');
            $query->setParameter('shipperID', $request->getShipperID());
        }

        if($request->getConsigneeID())
        {
            $query->andWhere('container.consigneeID = :consigneeID');
            $query->setParameter('consigneeID', $request->getConsigneeID());
        }

        if($request->getShipmentID())
        {
            $query->andWhere('container.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $request->getShipmentID());
        }

        if($isExternalWarehouse)
        {
            $query->andWhere("orderShipmentEntity.isExternalWarehouse = :isExternalWarehouse");
            $query->setParameter('isExternalWarehouse', 1);
        }
        elseif (isset($isExternalWarehouse) AND $isExternalWarehouse == false)
        {
            $query->andWhere("container.shipmentID IS NULL");
        }

        if($request->getClientUserID())
        {
            $query->andWhere('container.clientUserID = :clientUserID');
            $query->setParameter('clientUserID', $request->getClientUserID());
        }

        if($withoutNumber)
        {
            $query->andWhere('container.containerNumber = :containerNumber');
            $query->setParameter('containerNumber', "");
        }
        elseif(isset($withoutNumber) AND $withoutNumber == false)
        {
            $query->andWhere("container.containerNumber != ''");
        }

        if($isRequested)
        {
            $query->andWhere('container.providedBy != :providedBy');
            $query->setParameter('providedBy', 0);
        }
        elseif(isset($isRequested) AND $isRequested == false)
        {
            $query->andWhere('container.providedBy = :providedBy');
            $query->setParameter('providedBy', 0);
        }

        if($request->getPortID())
        {
            $query->andWhere('container.portID = :portID');
            $query->setParameter('portID', $request->getPortID());
        }

        return $query->getQuery()->getResult();
    }

    public function getContainerByNumber($containerNumber)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName')

            ->andWhere('container.containerNumber = :containerNumber')
            ->setParameter('containerNumber', $containerNumber)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = container.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getContainerByShipperID($shipperID)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
                'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
                'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

            ->andWhere('container.shipperID = :shipperID')
            ->setParameter('shipperID', $shipperID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity3',
                Join::WITH,
                'subcontractEntity3.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->leftJoin(
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = container.shipperID'
            )

            ->orderBy('container.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getContainersBySpecificationID($specificationID)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'shipperEntity.name as shipperName', 'subcontractEntity4.fullName as carrierName')

            ->andWhere('container.specificationID = :specificationID')
            ->setParameter('specificationID', $specificationID)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = container.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = container.updatedBy'
            )

            ->leftJoin(
                ContainerSpecificationEntity::class,
                'containerSpecification',
                Join::WITH,
                'containerSpecification.id = container.specificationID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = container.providedBy'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = container.consigneeID'
            )

            ->leftJoin(
                ShipperEntity::class,
                'shipperEntity',
                Join::WITH,
                'shipperEntity.id = container.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity4',
                Join::WITH,
                'subcontractEntity4.id = container.carrierID'
            )

            ->orderBy('container.id', 'DESC')
            ->setMaxResults(100)

            ->getQuery()
            ->getResult();
    }

    public function getSpecificationIdAndExportCountryIdAndExportCityAndPortIdByContainerID($containerID)
    {
        return $this->createQueryBuilder('container')
            ->select('container.specificationID', 'exportPortsEntity.countryID', 'exportPortsEntity.city', 'container.portID')

            ->andWhere('container.id = :id')
            ->setParameter('id', $containerID)

            ->leftJoin(
                PortsEntity::class,
                'exportPortsEntity',
                Join::WITH,
                'exportPortsEntity.id = container.exportPortID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getProxyIdOfExportWarehouseByContainerID($containerID)
    {
        return $this->createQueryBuilder('container_entity')
            ->select('container_entity.exportWarehouseID', 'exportWarehouseEntity.proxyID as exportProxyID')

            ->andWhere('container_entity.id = :id')
            ->setParameter('id', $containerID)

            ->leftJoin(
                WarehouseEntity::class,
                'exportWarehouseEntity',
                Join::WITH,
                'exportWarehouseEntity.id = container_entity.exportWarehouseID'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function deleteAllContainers()
    {
        return $this->createQueryBuilder('container')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
