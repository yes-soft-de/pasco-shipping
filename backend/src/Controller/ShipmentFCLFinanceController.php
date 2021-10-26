<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ShipmentFCLFinanceCreateRequest;
use App\Request\ShipmentFCLFinanceFilterRequest;
use App\Service\ShipmentFCLFinanceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentFCLFinanceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentFCLFinanceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentFCLFinanceService $shipmentFCLFinanceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentFCLFinanceService = $shipmentFCLFinanceService;
    }

    /**
     * @Route("shipmentfclfinance", name="createShipmentFCLFinance", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment FCL Finance")
     *
     * @OA\RequestBody(
     *      description="Create new shipment fcl finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="stageDescription"),
     *          @OA\Property(type="number", property="stageCost"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="integer", property="subcontractID"),
     *          @OA\Property(type="string", property="paymentType"),
     *          @OA\Property(type="string", property="chequeNumber"),
     *          @OA\Property(type="integer", property="proxyID"),
     *          @OA\Property(type="string", property="currency")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shipment fcl finance",
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

        $request = $this->autoMapping->map(stdClass::class, ShipmentFCLFinanceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentFCLFinanceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filtershipmentfclfinance", name="filterShipmentFCLFinances", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment FCL Finance")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="integer", property="exportWarehouseID"),
     *          @OA\Property(type="integer", property="importWarehouseID")
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
     *                      @OA\Property(type="string", property="proxyName"),
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
     *              @OA\Property(type="string", property="shippingType")
     *          )
     *      )
     * )
     *
     */
    public function filterShipmentFCLFinances(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentFCLFinanceFilterRequest::class, (object)$data);

        $result = $this->shipmentFCLFinanceService->filterShipmentFCLFinances($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("deleteallshipmentsfclfinances", name="deleteAllShipmentsFCLFinances", methods={"DELETE"})
     * @return JsonResponse
     */
    public function deleteAllShipmentFCLFinances()
    {
        $result = $this->shipmentFCLFinanceService->deleteAllShipmentFCLFinances();

        return $this->response($result, self::DELETE);
    }

}