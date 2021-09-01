<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\SubcontractEntity;
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
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt', 'travel.carrierID', 'subcontractEntity2.fullName as carrierName')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = travel.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = travel.carrierID'
            )

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByTypeAndStatus($type, $status)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt', 'travel.carrierID', 'subcontractEntity2.fullName as carrierName')

            ->andWhere('travel.type = :type')
            ->setParameter('type', $type)

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = travel.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = travel.carrierID'
            )

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelByID($id)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt', 'travel.carrierID', 'subcontractEntity2.fullName as carrierName')

            ->andWhere('travel.id = :id')
            ->setParameter('id', $id)

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = travel.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = travel.carrierID'
            )
            
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function filterTravels($type, $launchCountry, $destinationCountry, $launchDate, $arrivalDate, $travelNumber, $shipperID, $status, $carrierID)
    {
        $query = $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt', 'travel.carrierID', 'subcontractEntity2.fullName as carrierName')

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

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity',
                Join::WITH,
                'subcontractEntity.id = travel.shipperID'
            )

            ->leftJoin(
                SubcontractEntity::class,
                'subcontractEntity2',
                Join::WITH,
                'subcontractEntity2.id = travel.carrierID'
            )

            ->orderBy('travel.id', 'DESC');

        if ($type)
        {
            $query->andWhere('travel.type = :type');
            $query->setParameter('type', $type);
        }
        if ($launchCountry)
        {
            $query->andWhere('travel.launchCountry = :launchCountry');
            $query->setParameter('launchCountry', $launchCountry);
        }
        if ($destinationCountry)
        {
            $query->andWhere('travel.destinationCountry = :destinationCountry');
            $query->setParameter('destinationCountry', $destinationCountry);
        }
        if ($launchDate)
        {
            $query->andWhere('travel.launchDate BETWEEN :firstDate AND :secondDate');
            $query->setParameter('firstDate', $launchDate);
            $query->setParameter('secondDate', (new \DateTime($launchDate))->modify('+1 day')->format('Y-m-d'));
        }
        if ($arrivalDate)
        {
            $query->andWhere('travel.arrivalDate BETWEEN :firstDate AND :secondDate');
            $query->setParameter('firstDate', $arrivalDate);
            $query->setParameter('secondDate', (new \DateTime($arrivalDate))->modify('+1 day')->format('Y-m-d'));
        }
        if ($travelNumber)
        {
            $query->andWhere('travel.travelNumber = :travelNumber');
            $query->setParameter('travelNumber', $travelNumber);
        }
        if ($shipperID)
        {
            $query->andWhere('travel.shipperID = :shipperID');
            $query->setParameter('shipperID', $shipperID);
        }
        if ($carrierID)
        {
            $query->andWhere('travel.carrierID = :carrierID');
            $query->setParameter('carrierID', $carrierID);
        }
        if ($status)
        {
            $query->andWhere('travel.status = :status');
            $query->setParameter('status', $status);
        }

        return $query->getQuery()->getResult();
    }

    public function deleteAllTravels()
    {
        return $this->createQueryBuilder('travel')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
