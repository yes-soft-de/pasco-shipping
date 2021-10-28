<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\CountryEntity;
use App\Entity\PortsEntity;
use App\Request\PortsFilterRequest;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PortsEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method PortsEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method PortsEntity[]    findAll()
 * @method PortsEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PortsEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PortsEntity::class);
    }

    public function filterPorts(PortsFilterRequest $request)
    {
        $query = $this->createQueryBuilder('ports_entity')
            ->select('ports_entity.id', 'ports_entity.name', 'ports_entity.countryID', 'countryEntity.name as countryName', 'ports_entity.city', 'ports_entity.location', 'ports_entity.type', 'ports_entity.createdAt',
             'ports_entity.updatedAt', 'ports_entity.createdBy', 'ports_entity.updatedBy', 'adminProfile1.userName as createdByUser', 'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser',
                'adminProfile2.image as updatedByUserImage')

            ->leftJoin(
                CountryEntity::class,
                'countryEntity',
                Join::WITH,
                'countryEntity.id = ports_entity.countryID'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = ports_entity.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = ports_entity.updatedBy'
            )

            ->orderBy('ports_entity.id', 'DESC');

        if($request->getName())
        {
            $query->andWhere('ports_entity.name LIKE :name');
            $query->setParameter('name', '%'.$request->getName().'%');
        }

        if($request->getCity())
        {
            $query->andWhere('ports_entity.city LIKE :city');
            $query->setParameter('city', '%'.$request->getCity().'%');
        }

        if($request->getType())
        {
            $query->andWhere('ports_entity.type = :type');
            $query->setParameter('type', $request->getType());
        }

        if($request->getCountryID())
        {
            $query->andWhere('ports_entity.countryID = :countryID');
            $query->setParameter('countryID', $request->getCountryID());
        }

        if($request->getCountryType())
        {
            $query->andWhere('countryEntity.type = :type');
            $query->setParameter('type', $request->getCountryType());
        }

        return $query->getQuery()->getResult();
    }

}
