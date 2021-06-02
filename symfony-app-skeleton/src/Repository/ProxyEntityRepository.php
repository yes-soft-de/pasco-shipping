<?php

namespace App\Repository;

use App\Entity\ProxyEntity;
use App\Entity\UserProfileEntity;
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
            'userProfile1.userName as createdByUser', 'userProfile1.image as createdByUserImage', 'userProfile2.userName as updatedByUser', 'userProfile2.image as updatedByUserImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile1',
                Join::WITH,
                'userProfile1.id = proxy.createdBy'
            )

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile2',
                Join::WITH,
                'userProfile2.id = proxy.updatedBy'
            )

            ->orderBy('proxy.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
