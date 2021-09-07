<?php

namespace App\Repository;

use App\Entity\PendingHolderEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PendingHolderEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method PendingHolderEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method PendingHolderEntity[]    findAll()
 * @method PendingHolderEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PendingHolderEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PendingHolderEntity::class);
    }

    public function getPendingHoldersByShipmentID($shipmentID)
    {
        return $this->createQueryBuilder('pendingHolderEntity')
            ->select('pendingHolderEntity.id', 'pendingHolderEntity.shipmentID', 'pendingHolderEntity.specificationID', 'pendingHolderEntity.notes', 'pendingHolderEntity.createdAt')

            ->andWhere('pendingHolderEntity.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->orderBy('pendingHolderEntity.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
