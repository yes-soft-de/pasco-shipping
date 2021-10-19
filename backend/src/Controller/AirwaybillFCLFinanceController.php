<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\AirwaybillDistributeStatusCostRequest;
use App\Request\AirwaybillFCLFinanceCreateRequest;
use App\Request\AirwaybillFCLFinanceFilterRequest;
use App\Service\AirwaybillFCLFinanceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AirwaybillFCLFinanceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $airwaybillFCLFinanceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, AirwaybillFCLFinanceService $airwaybillFCLFinanceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->airwaybillFCLFinanceService = $airwaybillFCLFinanceService;
    }

    /**
     * @Route("airwaybillfclfinance", name="createAirwaybillFCLFinance", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill FCL Finance")
     *
     * @OA\RequestBody(
     *      description="Create new airwaybill fcl finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="airwaybillID"),
     *          @OA\Property(type="string", property="stageDescription"),
     *          @OA\Property(type="number", property="stageCost"),
     *          @OA\Property(type="number", property="sellingCost"),
     *          @OA\Property(type="number", property="buyingCost"),
     *          @OA\Property(type="string", property="status"),
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
     *      description="Returns the creation date of the new airwaybill finance",
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

        $request = $this->autoMapping->map(stdClass::class, AirwaybillFCLFinanceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillFCLFinanceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filterairwaybillfclfinance", name="filterAirwaybillFCLFinances", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill FCL Finance")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="airwaybillID"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get the finances info of the air waybills",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="array", property="airwaybillFinances",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="airwaybillID"),
     *                      @OA\Property(type="string", property="status"),
     *                      @OA\Property(type="number", property="stageCost"),
     *                      @OA\Property(type="number", property="sellingCost"),
     *                      @OA\Property(type="number", property="buyingCost"),
     *                      @OA\Property(type="string", property="stageDescription"),
     *                      @OA\Property(type="string", property="currency"),
     *                      @OA\Property(type="string", property="subcontractName"),
     *                      @OA\Property(type="string", property="importWarehouseName"),
     *                      @OA\Property(type="string", property="clientUsername"),
     *                      @OA\Property(type="string", property="paymentType"),
     *                      @OA\Property(type="string", property="proxyName"),
     *                      @OA\Property(type="string", property="chequeNumber"),
     *                      @OA\Property(type="array", property="shipmentInfo",
     *                          @OA\Items(
     *                              @OA\Property(type="integer", property="id"),
     *                              @OA\Property(type="integer", property="shipmentID"),
     *                              @OA\Property(type="string", property="trackNumber"),
     *                              @OA\Property(type="integer", property="holderType"),
     *                              @OA\Property(type="integer", property="holderID"),
     *                              @OA\Property(type="integer", property="travelID"),
     *                              @OA\Property(type="object", property="createdAt"),
     *                              @OA\Property(type="object", property="updatedAt"),
     *                              @OA\Property(type="integer", property="amount"),
     *                              @OA\Property(type="integer", property="createdBy"),
     *                              @OA\Property(type="integer", property="updatedBy")
     *                          )
     *                      ),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage"),
     *                      @OA\Property(type="string", property="updatedByUser"),
     *                      @OA\Property(type="string", property="updatedByUserImage")
     *                  )
     *              ),
     *              @OA\Property(type="number", property="currentTotalBuyingCost"),
     *              @OA\Property(type="number", property="currentTotalSellingCost")
     *          )
     *      )
     * )
     *
     */
    public function filterAirWaybillFCLFinances(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillFCLFinanceFilterRequest::class, (object)$data);

        $result = $this->airwaybillFCLFinanceService->filterAirWaybillFCLFinances($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("distributeairwaybillcost", name="distributeAirwaybillCostOnShipments", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill Finance")
     * 
     * @OA\RequestBody(
     *      description="Distribute air waybill cost of status on shipments",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="airwaybillID"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="string", property="currency")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the shipments stored in the air waybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="statusDetails"),
     *                  @OA\Property(type="bool", property="isInOneHolder"),
     *                  @OA\Property(type="bool", property="packed"),
     *                  @OA\Property(type="string", property="travelStatus"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="string", property="supplierName"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseName"),
     *                  @OA\Property(type="string", property="importWarehouseName"),
     *                  @OA\Property(type="integer", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="string", property="markNumber"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="float", property="weight"),
     *                  @OA\Property(type="float", property="volumec"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="integer", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="externalWarehouseInfo"),
     *                  @OA\Property(type="bool", property="isExternalWarehouse")
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function distributeAirwaybillCost(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillDistributeStatusCostRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillFCLFinanceService->distributeAirwaybillCost($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("deleteallairwaybillsfclfinances", name="deleteAllAirwaybillsFCLFinances", methods={"DELETE"})
     * @return JsonResponse
     */
    public function deleteAllAirWaybillsFCLFinances()
    {
        $result = $this->airwaybillFCLFinanceService->deleteAllAirWaybillsFCLFinances();

        return $this->response($result, self::DELETE);
    }

}