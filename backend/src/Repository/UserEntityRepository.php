<?php

namespace App\Repository;

use App\Entity\AdminProfileEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\UserEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @method UserEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserEntity[]    findAll()
 * @method UserEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserEntityRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UserEntity::class);
    }

    /**
     * Used to upgrade (rehash) the user's password automatically over time.
     */
    public function upgradePassword(UserInterface $user, string $newEncodedPassword): void
    {
        if (!$user instanceof UserEntity) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', \get_class($user)));
        }

        $user->setPassword($newEncodedPassword);
        $this->_em->persist($user);
        $this->_em->flush();
    }
    
    public function getUserByUserID($userID)
    {
        return $this->createQueryBuilder('user')

            ->select('user.id', 'user.userID')
            ->andWhere('user.userID=:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getUserByEmail($email)
    {
        return $this->createQueryBuilder('user')
            ->andWhere('user.email = :email')
            ->setParameter('email', $email)
            ->getQuery()
            ->getOneOrNullResult()
            ;
    }

    public function getFullClientInfoByUserID($userID)
    {
        return $this->createQueryBuilder('user')
            ->select('user.id', 'user.roles', 'user.userID', 'user.createAt', 'user.createdBy', 'user.updatedBy', 'user.email', 'clientProfile.userName', 'clientProfile.image', 
            'clientProfile.city', 'clientProfile.country', 'clientProfile.location', 'clientProfile.phone', 'adminProfile1.userName as createdByUser', 
            'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('user.id = :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = user.id'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = user.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = user.updatedBy'
            )

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAllClients()
    {
        return $this->createQueryBuilder('user')
            ->select('user.id', 'user.userID', 'user.roles', 'user.email', 'user.createAt', 'user.createdBy', 'user.updatedBy', 'clientProfile.userName',
             'clientProfile.city', 'clientProfile.image', 'clientProfile.country', 'clientProfile.location', 'clientProfile.phone', 'adminProfile1.userName as createdByUser', 
             'adminProfile1.image as createdByUserImage', 'adminProfile2.userName as updatedByUser', 'adminProfile2.image as updatedByUserImage')

            ->andWhere('user.roles LIKE :clientRole')
            ->setParameter('clientRole',  '%"'.'user'.'"%')

            ->leftJoin(
                ClientProfileEntity::class,
                'clientProfile',
                Join::WITH,
                'clientProfile.userID = user.id'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile1',
                Join::WITH,
                'adminProfile1.userID = user.createdBy'
            )

            ->leftJoin(
                AdminProfileEntity::class,
                'adminProfile2',
                Join::WITH,
                'adminProfile2.userID = user.updatedBy'
            )

            ->orderBy('user.id', 'DESC')

            ->getQuery()
            ->getResult();
    }

}
