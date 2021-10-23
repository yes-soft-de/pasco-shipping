<?php

namespace App\Controller;

use App\Entity\AdminProfileEntity;
use App\Entity\AirwaybillEntity;
use App\Entity\AirwaybillFCLFinanceEntity;
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
use App\Entity\ShipmentLCLFinanceEntity;
use App\Entity\ShipmentLogEntity;
use App\Entity\ShipmentStatusEntity;
use App\Entity\SubcontractEntity;
use App\Entity\SupplierEntity;
use App\Entity\TrackEntity;
use App\Entity\TravelEntity;
use App\Entity\TravelFinanceEntity;
use App\Entity\UserEntity;
use App\Entity\WarehouseEntity;
use App\Service\MainService;
use App\Service\ShipmentPurchaseBillService;
use Doctrine\ORM\Tools\SchemaTool;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class ShipmentPurchaseBillController extends BaseController
{
    private $shipmentPurchaseBillService;

    public function __construct(SerializerInterface $serializer, ShipmentPurchaseBillService $shipmentPurchaseBillService)
    {
        parent::__construct($serializer);

        $this->shipmentPurchaseBillService = $shipmentPurchaseBillService;
    }

    /**
     * @Route("shipmentpurchasesbill/{shipmentID}", name="getPurchasesBillByShipmentID", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Purchases Bill")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one holds statistics info",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="array", property="holderFinances",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="airwaybillID"),
     *                      @OA\Property(type="string", property="status"),
     *                      @OA\Property(type="number", property="buyingCost"),
     *                      @OA\Property(type="string", property="stageDescription"),
     *                      @OA\Property(type="string", property="currency"),
     *                      @OA\Property(type="integer", property="subcontractID"),
     *                      @OA\Property(type="string", property="subcontractName"),
     *                      @OA\Property(type="string", property="paymentType"),
     *                      @OA\Property(type="integer", property="proxyID"),
     *                      @OA\Property(type="string", property="proxyName"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="object", property="createdBy"),
     *                      @OA\Property(type="object", property="updatedBy"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="updatedByUser")
     *                  )
     *              ),
     *              @OA\Property(type="number", property="currentTotalBuyingCost")
     *          )
     *          )
     *      )
     * )
     *
     */
    public function getPurchaseBillByShipmentID($shipmentID)
    {
        $result = $this->shipmentPurchaseBillService->getPurchaseBillByShipmentID($shipmentID);

        return $this->response($result, self::FETCH);
    }

}