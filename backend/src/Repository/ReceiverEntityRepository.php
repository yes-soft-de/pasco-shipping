<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ReceiverEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReceiverEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReceiverEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReceiverEntity[]    findAll()
 * @method ReceiverEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReceiverEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReceiverEntity::class);
    }

    public function filterReceivers($clientUserID, $createdBy)
    {
        $query = $this->createQueryBuilder('receiverEntity')
            ->select('receiverEntity.id', 'receiverEntity.fullName', 'receiverEntity.phone', 'receiverEntity.email', 'receiverEntity.address', 'receiverEntity.clientUserID', 'receiverEntity.createdAt', 'receiverEntity.updatedAt',
            'receiverEntity.createdBy', 'receiverEntity.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage',
            'clientProfile.userName as clientUsername')

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = receiverEntity.clientUserID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = receiverEntity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = receiverEntity.updatedBy'
            )

            ->orderBy('receiverEntity.id', 'DESC');

        if($clientUserID)
        {
            $query->andWhere('receiverEntity.clientUserID = :clientUserID');
            $query->setParameter('clientUserID', $clientUserID);
        }

        if($createdBy)
        {
            $query->andWhere('receiverEntity.createdBy = :createdBy');
            $query->setParameter('createdBy', $createdBy);
        }

        return $query->getQuery()->getResult();
    }

    public function getReceiversByClientUserID($clientUserID)
    {
        return $this->createQueryBuilder('receiverEntity')
            ->select('receiverEntity.id', 'receiverEntity.fullName', 'receiverEntity.phone', 'receiverEntity.email', 'receiverEntity.address', 'receiverEntity.clientUserID', 'receiverEntity.createdAt', 'receiverEntity.updatedAt')

            ->andWhere('receiverEntity.clientUserID = :clientUserID')
            ->setParameter('clientUserID', $clientUserID)

            ->orderBy('receiverEntity.id', 'DESC')
            
            ->getQuery()
            ->getResult();
    }

}
