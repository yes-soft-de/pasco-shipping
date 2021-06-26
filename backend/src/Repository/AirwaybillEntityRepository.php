<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AirwaybillEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AirwaybillEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AirwaybillEntity[]    findAll()
 * @method AirwaybillEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AirwaybillEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AirwaybillEntity::class);
    }

    public function getAirwaybillsByStatus($status)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt',
                'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'adminProfile2.userName as updatedByUserImage')

            ->andWhere('airwaybill.status = :status')
            ->setParameter('status', $status)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->orderBy('airwaybill.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

    public function getAirwaybillById($id)
    {
        return $this->createQueryBuilder('airwaybill')
            ->select('airwaybill.id', 'airwaybill.specificationID', 'airwaybill.airwaybillNumber', 'airwaybill.status', 'airwaybill.createdAt', 'airwaybill.updatedAt',
             'airwaybill.createdBy', 'airwaybill.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'adminProfile2.userName as updatedByUserImage')

            ->andWhere('airwaybill.id = :id')
            ->setParameter('id', $id)

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = airwaybill.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = airwaybill.updatedBy'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

}
