<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\TravelEntity;
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
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('travel.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = travel.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = travel.updatedBy'
            )

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

}
