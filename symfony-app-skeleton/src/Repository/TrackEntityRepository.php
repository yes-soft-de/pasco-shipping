<?php

namespace App\Repository;

use App\Entity\TrackEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
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
            ->getOneOrNullResult()
        ;
    }
    
}
