<?php

namespace App\Repository;

use App\Entity\TravelEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TravelEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method TravelEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method TravelEntity[]    findAll()
 * @method TravelEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TravelEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TravelEntity::class);
    }

    public function getTravelsByStatus($status)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage', 'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->andWhere('travel.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = travel.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = travel.updatedBy'
            )

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

}
