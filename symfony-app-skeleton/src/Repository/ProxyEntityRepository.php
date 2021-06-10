<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ProxyEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ProxyEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProxyEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProxyEntity[]    findAll()
 * @method ProxyEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProxyEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProxyEntity::class);
    }

    public function getAllProxies()
    {
        return $this->createQueryBuilder('proxy')
            ->select('proxy.id', 'proxy.fullName', 'proxy.phone', 'proxy.address', 'proxy.createdAt', 'proxy.updatedAt', 'proxy.createdBy', 'proxy.updatedBy',
            'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = proxy.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = proxy.updatedBy'
            )

            ->orderBy('proxy.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
