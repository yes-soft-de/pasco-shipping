<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ShipmentLCLFinanceCreateRequest;
use App\Request\ShipmentLCLFinanceFilterRequest;
use App\Service\ShipmentLCLFinanceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentLCLFinanceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentLCLFinanceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentLCLFinanceService $shipmentLCLFinanceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentLCLFinanceService = $shipmentLCLFinanceService;
    }

    /**
     * @Route("shipmentlclfinance", name="createShipmentLCLFinance", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment LCL Finance")
     *
     * @OA\RequestBody(
     *      description="Create new shipment lcl finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="stageDescription"),
     *          @OA\Property(type="number", property="stageCost"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="integer", property="subcontractID"),
     *          @OA\Property(type="string", property="paymentType"),
     *          @OA\Property(type="string", property="chequeNumber"),
     *          @OA\Property(type="string", property="financialFundName"),
     *          @OA\Property(type="string", property="currency")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shipment lcl finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentLCLFinanceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentLCLFinanceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("shipmentfinance/{shipmentID}/{trackNumber}", name="getShipmentFinanceByShipmentIdAndTrackNumber", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Shipment Finance")
     * 
     * @OA\Parameter(
     *      name="shipmentID",
     *      in="path",
     *      required="true",
     *      description="the id of the shipment order"
     * )
     * 
     * @OA\Parameter(
     *      name="trackNumber",
     *      in="path",
     *      required="true",
     *      description="the track number of the shipment"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the shipment finances",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="shipmentStatus"),
     *                  @OA\Property(type="number", property="stageCost"),
     *                  @OA\Property(type="string", property="stageDescription"),
     *                  @OA\Property(type="string", property="currency"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber)
    {
        $result = $this->shipmentLCLFinanceService->getAllCostsByShipmentIdAndTrackNumber($shipmentID, $trackNumber);
        
        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filtershipmentlclfinance", name="filterShipmentLCLFinances", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment LCL Finance")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="integer", property="exportWarehouseID"),
     *          @OA\Property(type="integer", property="importWarehouseID"),
     *          @OA\Property(type="integer", property="containerID"),
     *          @OA\Property(type="integer", property="airwaybillID"),
     *          @OA\Property(type="integer", property="travelID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get the finances info of the shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="array", property="shipmentFinances",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="shipmentID"),
     *                      @OA\Property(type="string", property="trackNumber"),
     *                      @OA\Property(type="string", property="shipmentStatus"),
     *                      @OA\Property(type="number", property="stageCost"),
     *                      @OA\Property(type="string", property="stageDescription"),
     *                      @OA\Property(type="string", property="currency"),
     *                      @OA\Property(type="string", property="subcontractName"),
     *                      @OA\Property(type="string", property="importWarehouseName"),
     *                      @OA\Property(type="string", property="paymentType"),
     *                      @OA\Property(type="string", property="financialFundName"),
     *                      @OA\Property(type="string", property="chequeNumber"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage"),
     *                      @OA\Property(type="string", property="updatedByUser"),
     *                      @OA\Property(type="string", property="updatedByUserImage")
     *                  )
     *              ),
     *              @OA\Property(type="number", property="currentTotalCost"),
     *              @OA\Property(type="string", property="shippingType"),
     *              @OA\Property(type="number", property="price")
     *          )
     *      )
     * )
     *
     */
    public function filterShipmentLCLFinances(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentLCLFinanceFilterRequest::class, (object)$data);

        $result = $this->shipmentLCLFinanceService->filterShipmentLCLFinances($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("deleteallshipmentslclfinances", name="deleteAllShipmentsLCLFinances", methods={"DELETE"})
     * @return JsonResponse
     */
    public function deleteAllShipmentLCLFinances()
    {
        $result = $this->shipmentLCLFinanceService->deleteAllShipmentLCLFinances();

        return $this->response($result, self::DELETE);
    }

}