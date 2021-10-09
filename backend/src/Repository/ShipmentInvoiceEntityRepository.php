<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ShipmentInvoiceEntity;
use App\Request\ShipmentInvoiceFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ShipmentInvoiceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ShipmentInvoiceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ShipmentInvoiceEntity[]    findAll()
 * @method ShipmentInvoiceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShipmentInvoiceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ShipmentInvoiceEntity::class);
    }

    public function filterShipmentInvoices(ShipmentInvoiceFilterRequest $request)
    {
        $query = $this->createQueryBuilder('shipmentInvoiceEntity')
            ->select('shipmentInvoiceEntity.id', 'shipmentInvoiceEntity.shipmentID', 'shipmentInvoiceEntity.createdAt', 'shipmentInvoiceEntity.createdBy', 'shipmentInvoiceEntity.updatedAt', 'shipmentInvoiceEntity.updatedBy',
             'shipmentInvoiceEntity.totalCost', 'shipmentInvoiceEntity.receiptImage', 'shipmentInvoiceEntity.invoiceImage', 'shipmentInvoiceEntity.paidBy', 'shipmentInvoiceEntity.paidOnBehalfBy', 'shipmentInvoiceEntity.notes',
             'shipmentInvoiceEntity.discount', 'shipmentInvoiceEntity.billDetails', 'shipmentInvoiceEntity.paymentStatus', 'shipmentInvoiceEntity.paymentDate', 'adminProfileEntityOne.userName as createdByUser',
                'adminProfileEntityOne.image as createdByUserImage', 'adminProfileEntityTwo.userName as updatedByUser', 'adminProfileEntityTwo.image as updatedByUserImage', 'clientProfileEntity.userName as clientUserName',
             'clientProfileEntity.image as clientImage', 'clientProfileEntity.userID as clientUserID')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityOne',
                Join::WITH,
                'adminProfileEntityOne.userID = shipmentInvoiceEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfileEntityTwo',
                Join::WITH,
                'adminProfileEntityTwo.userID = shipmentInvoiceEntity.updatedBy'
            )

            ->leftJoin(
                OrderShipmentEntity::class,
                'orderShipmentEntity',
                Join::WITH,
                'orderShipmentEntity.id = shipmentInvoiceEntity.shipmentID'
            )

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfileEntity',
                Join::WITH,
                'clientProfileEntity.userID = orderShipmentEntity.clientUserID'
            )
//
//            ->leftJoin(
//                ClientProfileEntity::class,
//                'clientProfileEntityTwo',
//                Join::WITH,
//                'clientProfileEntityTwo.userID = orderShipmentEntity.clientUserID'
//            )

            ->orderBy('shipmentInvoiceEntity.id', 'DESC');

        if($request->getShipmentID())
        {
            $query->andWhere('shipmentInvoiceEntity.shipmentID = :shipmentID');
            $query->setParameter('shipmentID', $request->getShipmentID());
        }

        if($request->getPaymentStatus())
        {
            $query->andWhere('shipmentInvoiceEntity.paymentStatus = :paymentStatus');
            $query->setParameter('paymentStatus', $request->getPaymentStatus());
        }

        return $query->getQuery()->getResult();
    }

}
