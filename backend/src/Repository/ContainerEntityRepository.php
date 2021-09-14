<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ContainerEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\SubcontractEntity;
use App\Entity\TrackEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

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
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID', 'container.createdBy', 'container.carrierID',
            'container.shipperID', 'container.type', 'container.providedBy', 'container.shipmentID', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName',
            'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage', 'container.clientUserID')

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

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterContainers($specificationID, $containerNumber, $status, $type, $providedBy, $shipperID, $consigneeID,
                                     $isExternalWarehouse, $shipmentID, $clientUserID)
    {
        $query = $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID', 'container.shipmentID', 'container.clientUserID',
                'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
                'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName',
                'clientProfileEntity.userName as clientUserName', 'clientProfileEntity.image as clientUserImage')

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

            ->orderBy('container.id', 'DESC')
            ->setMaxResults(100);

        if($specificationID)
        {
            $query->andWhere('container.specificationID = :specificationID');
            $query->setParameter('specificationID', $specificationID);
        }

        if($containerNumber)
        {
            $query->andWhere('container.containerNumber = :containerNumber');
            $query->setParameter('containerNumber', $containerNumber);
        }

        if($status)
        {
            $query->andWhere('container.status = :status');
            $query->setParameter('status', $status);
        }

        if($type)
        {
            $query->andWhere('container.type = :type');
            $query->setParameter('type', $type);
        }

        if($providedBy)
        {
            $query->andWhere('container.providedBy = :providedBy');
            $query->setParameter('providedBy', $providedBy);
        }

        if($shipperID)
        {
            $query->andWhere('container.shipperID = :shipperID');
            $query->setParameter('shipperID', $shipperID);
        }

        if($consigneeID)
        {
            $query->andWhere('container.consigneeID = :consigneeID');
            $query->setParameter('consigneeID', $consigneeID);
        }

        if($shipmentID)
        {
            $query->andWhere('container.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $shipmentID);
        }

        if($isExternalWarehouse == true)
        {
            $query->andWhere("orderShipmentEntity.isExternalWarehouse = 1");
        }
        elseif (isset($isExternalWarehouse) AND $isExternalWarehouse == false)
        {
            $query->andWhere("container.shipmentID IS NULL");
        }

        if($clientUserID)
        {
            $query->andWhere('container.clientUserID = :clientUserID');
            $query->setParameter('clientUserID', $clientUserID);
        }

        return $query->getQuery()->getResult();
    }

    public function getContainerByNumber($containerNumber)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

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

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getContainersBySpecificationID($specificationID)
    {
        return $this->createQueryBuilder('container')
            ->select('container.id', 'container.specificationID', 'container.containerNumber', 'container.status', 'container.createdAt', 'container.updatedAt', 'container.createdBy', 'container.updatedBy', 'container.consigneeID',
            'container.shipperID', 'container.carrierID', 'container.type', 'container.providedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.userName as updatedByUserImage',
            'containerSpecification.name as specificationName', 'subcontractEntity.fullName as subcontractName', 'subcontractEntity2.fullName as consigneeName', 'subcontractEntity3.fullName as shipperName', 'subcontractEntity4.fullName as carrierName')

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

    public function deleteAllContainers()
    {
        return $this->createQueryBuilder('container')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
