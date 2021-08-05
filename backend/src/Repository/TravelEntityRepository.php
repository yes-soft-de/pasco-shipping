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
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByTypeAndStatus($type, $status)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelByID($id)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

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
            
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getTravelsByType($type)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.type = :type')
            ->setParameter('type', $type)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByLaunchCountry($launchCountry)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.launchCountry = :launchCountry')
            ->setParameter('launchCountry', $launchCountry)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByDestinationCountry($destinationCountry)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.destinationCountry = :destinationCountry')
            ->setParameter('destinationCountry', $destinationCountry)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByLaunchDate($launchDate)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.launchDate = :launchDate')
            ->setParameter('launchDate', $launchDate)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByArrivalDate($arrivalDate)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.arrivalDate = :arrivalDate')
            ->setParameter('arrivalDate', $arrivalDate)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByShipperID($shipperID)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.shipperID = :shipperID')
            ->setParameter('shipperID', $shipperID)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByTypeAndLaunchCountry($type, $launchCountry)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.type = :type')
            ->setParameter('type', $type)

            ->andWhere('travel.launchCountry = :launchCountry')
            ->setParameter('launchCountry', $launchCountry)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByTypeAndLaunchAndDestinationCountry($type, $launchCountry, $destinationCountry)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.type = :type')
            ->setParameter('type', $type)

            ->andWhere('travel.launchCountry = :launchCountry')
            ->setParameter('launchCountry', $launchCountry)

            ->andWhere('travel.destinationCountry = :destinationCountry')
            ->setParameter('destinationCountry', $destinationCountry)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelsByTypeAndLaunchAndDestinationCountriesAndLaunchDate($type, $launchCountry, $destinationCountry, $launchDate)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.type = :type')
            ->setParameter('type', $type)

            ->andWhere('travel.launchCountry = :launchCountry')
            ->setParameter('launchCountry', $launchCountry)

            ->andWhere('travel.destinationCountry = :destinationCountry')
            ->setParameter('destinationCountry', $destinationCountry)

            ->andWhere('travel.launchDate = :launchDate')
            ->setParameter('launchDate', $launchDate)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function getTravelByNumber($travelNumber)
    {
        return $this->createQueryBuilder('travel')
            ->select('travel.id', 'travel.type', 'travel.travelNumber', 'travel.launchCountry', 'travel.destinationCountry', 'travel.launchDate', 'travel.arrivalDate', 'travel.createdBy', 'travel.updatedBy',
             'travel.status', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
             'travel.shipperID', 'subcontractEntity.fullName as subcontractName', 'travel.createdAt', 'travel.updatedAt')

            ->andWhere('travel.travelNumber = :travelNumber')
            ->setParameter('travelNumber', $travelNumber)

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

            ->orderBy('travel.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

    public function deleteAllTravels()
    {
        return $this->createQueryBuilder('travel')
            ->delete()

            ->getQuery()
            ->getResult();
    }

}
