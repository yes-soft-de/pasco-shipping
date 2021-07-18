<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\DistributorEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\TrackEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\TravelEntity;
use App\Entity\WarehouseEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TrackEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method TrackEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method TrackEntity[]    findAll()
 * @method TrackEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TrackEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TrackEntity::class);
    }

    public function getByHolderIdAndTrackNumber($holderID, $trackNumber): ?TrackEntity
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getByHolderTypeAndHolderID($holderType, $holderID)
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.holderID = :holderID')
            ->setParameter('holderID', $holderID)

            ->andWhere('track.holderType = :holderType')
            ->setParameter('holderType', $holderType)

            ->getQuery()
            ->getResult();
    }

    public function getByTravelID($travelID)
    {
        return $this->createQueryBuilder('track')

            ->andWhere('track.travelID = :travelID')
            ->setParameter('travelID', $travelID)

            ->getQuery()
            ->getResult();
    }

    public function getByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        return $this->createQueryBuilder('track')
            ->select('track.id', 'track.shipmentID', 'track.trackNumber', 'track.travelID', 'track.holderType', 'track.holderID', 'track.createdAt', 'track.updatedAt', 'track.createdBy', 
            'track.updatedBy', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate')

            ->andWhere('track.shipmentID = :shipmentID')
            ->setParameter('shipmentID', $shipmentID)

            ->andWhere('track.trackNumber = :trackNumber')
            ->setParameter('trackNumber', $trackNumber)

            ->leftJoin(
                TravelEntity::class,
                'travel',
                Join::WITH,
                'travel.id = track.travelID'
            )

            ->orderBy('track.id', 'DESC')

            ->getQuery()
            ->getResult();
    }
    
}
