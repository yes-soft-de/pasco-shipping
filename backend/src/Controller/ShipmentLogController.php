<?php

namespace App\Controller;

use App\Service\ShipmentLogService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class ShipmentLogController extends BaseController
{
    private $shipmentLogService;

    public function __construct(SerializerInterface $serializer, ShipmentLogService $shipmentLogService)
    {
        parent::__construct($serializer);

        $this->shipmentLogService = $shipmentLogService;
    }

    /**
     * @Route("shipmentslogs", name="getAllShipmentsLogs", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Log")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a log of a shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="object", property="createdAt")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAll()
    {
        $result = $this->shipmentLogService->getAllShipmentsLogs();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipmentlogs/{shipmentID}", name="getAllShipmentLogsByShipmentID", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Log")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a log of a shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="object", property="createdAt")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getShipmentLogsByShipmentID($shipmentID)
    {
        $result = $this->shipmentLogService->getShipmentLogsByShipmentID($shipmentID);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("allshipmentlogs/{shipmentID}", name="getAllShipmentLogsByShipmentIdForDashboard", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Log")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a log of a shipment - for dashboard",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="shipmentID"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAllShipmentLogsByShipmentID($shipmentID)
    {
        $result = $this->shipmentLogService->getAllShipmentLogsByShipmentID($shipmentID);

        return $this->response($result, self::FETCH);
    }

}