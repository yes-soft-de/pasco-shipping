<?php

namespace App\Controller;

use App\AutoMapping;
use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use App\Entity\AirwaybillFinanceEntity;
use App\Entity\AirwaybillSpecificationEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\ContainerEntity;
use App\Entity\ContainerFCLFinanceEntity;
use App\Entity\ContainerSpecificationEntity;
use App\Entity\CountryEntity;
use App\Entity\DistributorEntity;
use App\Entity\GunnyEntity;
use App\Entity\GunnyShipmentEntity;
use App\Entity\ImageEntity;
use App\Entity\MarkEntity;
use App\Entity\OrderShipmentEntity;
use App\Entity\PendingHolderEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ProxyEntity;
use App\Entity\ReceivedShipmentEntity;
use App\Entity\ResetPasswordRequestEntity;
use App\Entity\SettingEntity;
use App\Entity\ShiftingShipmentOrderEntity;
use App\Entity\ShipmentFinanceEntity;
use App\Entity\ShipmentLogEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\SupplierEntity;
use App\Entity\TrackEntity;
use App\Entity\TravelEntity;
use App\Entity\TravelFinanceEntity;
use App\Entity\UserEntity;
use App\Entity\WarehouseEntity;
use App\Request\UserUpdateRequest;
use App\Service\MainService;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\SchemaTool;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MainController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $mainService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, MainService $mainService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->mainService = $mainService;
    }

    /**
     * @Route("statistics", name="getStatistics", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Main")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one holds statistics info",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="orders",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="number", property="waitingOrders"),
     *                      @OA\Property(type="number", property="acceptedOrders"),
     *                  ),
     *                  @OA\Property(type="object", property="travels",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="object", property="flight",
     *                          @OA\Property(type="number", property="total"),
     *                          @OA\Property(type="number", property="current"),
     *                          @OA\Property(type="number", property="started"),
     *                          @OA\Property(type="number", property="released"),
     *                      ),
     *                      @OA\Property(type="object", property="cruise",
     *                          @OA\Property(type="number", property="total"),
     *                          @OA\Property(type="number", property="current"),
     *                          @OA\Property(type="number", property="started"),
     *                          @OA\Property(type="number", property="released"),
     *                      )
     *                  ),
     *                  @OA\Property(type="object", property="users",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="number", property="customers"),
     *                      @OA\Property(type="number", property="employees"),
     *                  )
     *          )
     *      )
     * )
     *
     */
    public function getStatistics()
    {
        $result = $this->mainService->getStatistics();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("changeuser", name="updateuser", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, UserUpdateRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->mainService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("allusers", name="getAllUsers", methods={"GET"})
     * @return JsonResponse
     */
    public function findAll()
    {
        $result = $this->mainService->findAll();

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("deleteallshipments", name="deleteAllShipments", methods={"DELETE"})
     * @return JsonResponse
     */
    public function deleteAllShipments()
    {
        $result = $this->mainService->deleteAllShipments();

        return $this->response($result, self::DELETE);
    }

    /**
     * @Route("eraseall", name="deleteAllData", methods={"DELETE"})
     */
    public function eraseAllData()
    {
        try
        {
            $em = $this->getDoctrine()->getManager();

            $em->getRepository(AdminProfileEntity::class)->createQueryBuilder('adminProfileEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(AirwaybillEntity::class)->createQueryBuilder('airwaybillEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(AirwaybillSpecificationEntity::class)->createQueryBuilder('airwaybillSpecificationEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ClientProfileEntity::class)->createQueryBuilder('clientProfileEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ContainerEntity::class)->createQueryBuilder('containerEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(CountryEntity::class)->createQueryBuilder('countryEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(DistributorEntity::class)->createQueryBuilder('distributorEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(MarkEntity::class)->createQueryBuilder('markEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(SettingEntity::class)->createQueryBuilder('settingEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(OrderShipmentEntity::class)->createQueryBuilder('orderShipmentEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ProductCategoryEntity::class)->createQueryBuilder('productCategoryEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ProxyEntity::class)->createQueryBuilder('proxyEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShipmentLogEntity::class)->createQueryBuilder('shipmentLogEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShipmentStatusEntity::class)->createQueryBuilder('shipmentStatusEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(SubcontractEntity::class)->createQueryBuilder('subcontractEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(SupplierEntity::class)->createQueryBuilder('supplierEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(TrackEntity::class)->createQueryBuilder('trackEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(TravelEntity::class)->createQueryBuilder('travelEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(UserEntity::class)->createQueryBuilder('userEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(WarehouseEntity::class)->createQueryBuilder('warehouseEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ResetPasswordRequestEntity::class)->createQueryBuilder('resetPasswordRequestEntity')
                ->delete()
                ->getQuery()
                ->execute();
            
        }
        catch (\Exception $ex)
        {
            return $this->json($ex);
        }

        return new Response("All Database information were being deleted");
    }

    /**
     * @Route("erasefirstgroup", name="deletAllShipmentsAndReleatedInfoAndHoldersAndTravels", methods={"DELETE"})
     */
    public function eraseAllShipmentsAndHoldersAndTravels()
    {
        try
        {
            $em = $this->getDoctrine()->getManager();

            $em->getRepository(AirwaybillEntity::class)->createQueryBuilder('airwaybill_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(AirwaybillSpecificationEntity::class)->createQueryBuilder('airwaybill_specification_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(AirwaybillFinanceEntity::class)->createQueryBuilder('airwaybill_finance_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ContainerEntity::class)->createQueryBuilder('containerEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ContainerSpecificationEntity::class)->createQueryBuilder('container_specification_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ContainerFCLFinanceEntity::class)->createQueryBuilder('container_finance_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(GunnyEntity::class)->createQueryBuilder('gunny_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(GunnyShipmentEntity::class)->createQueryBuilder('gunny_shipment_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ImageEntity::class)->createQueryBuilder('image_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(PendingHolderEntity::class)->createQueryBuilder('pending_holder_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ReceivedShipmentEntity::class)->createQueryBuilder('received_shipment_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShipmentFinanceEntity::class)->createQueryBuilder('shipment_finance_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(OrderShipmentEntity::class)->createQueryBuilder('orderShipmentEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShipmentLogEntity::class)->createQueryBuilder('shipmentLogEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShipmentStatusEntity::class)->createQueryBuilder('shipmentStatusEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(ShiftingShipmentOrderEntity::class)->createQueryBuilder('shifting_shipment_order_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(TrackEntity::class)->createQueryBuilder('trackEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(TravelEntity::class)->createQueryBuilder('travelEntity')
                ->delete()
                ->getQuery()
                ->execute();

            $em->getRepository(TravelFinanceEntity::class)->createQueryBuilder('travel_finance_entity')
                ->delete()
                ->getQuery()
                ->execute();

        }
        catch (\Exception $ex)
        {
            return $this->json($ex);
        }

        return new Response("All Database information were being deleted");
    }

    /**
     * @Route("createnewschema", name="createNewSchema", methods={"DELETE"})
     */
    public function dropAllTablesOfDB()
    {
        $em = $this->getDoctrine()->getManager();
        $entitiesArray = $this->getDoctrine()->getManager()->getMetadataFactory()->getAllMetadata();

        $tool = new SchemaTool($em);

        $tool->dropSchema($entitiesArray);
        $tool->createSchema($entitiesArray);

        if($tool)
        {
            return $this->response("ِAll data were being deleted", self::DELETE);
        }
    }

}