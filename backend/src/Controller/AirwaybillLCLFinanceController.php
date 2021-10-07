<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\AirwaybillLCLFinanceCreateRequest;
use App\Request\AirwaybillLCLFinanceFilterRequest;
use App\Service\AirwaybillLCLFinanceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AirwaybillLCLFinanceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $airwaybillLCLFinanceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, AirwaybillLCLFinanceService $airwaybillLCLFinanceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->airwaybillLCLFinanceService = $airwaybillLCLFinanceService;
    }

    /**
     * @Route("airwaybilllclfinance", name="createAirWaybillLCLFinance", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill LCL Finance")
     *
     * @OA\RequestBody(
     *      description="Create new air waybill lcl finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="airwaybillID"),
     *          @OA\Property(type="string", property="stageDescription"),
     *          @OA\Property(type="number", property="stageCost"),
     *          @OA\Property(type="string", property="status"),
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
     *      description="Returns the creation date of the new air waybill finance",
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

        $request = $this->autoMapping->map(stdClass::class, AirwaybillLCLFinanceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillLCLFinanceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filterairwaybilllclfinance", name="filterAirWaybillLCLFinances", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill LCL Finance")
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
     *      description="Get the finances info of the air waybill",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="array", property="airWaybillFinances",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="airwaybillID"),
     *                      @OA\Property(type="string", property="status"),
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
     *              @OA\Property(type="number", property="currentTotalCost")
     *          )
     *      )
     * )
     *
     */
    public function filterAirWaybillsLCLFinances(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AirwaybillLCLFinanceFilterRequest::class, (object)$data);

        $result = $this->airwaybillLCLFinanceService->filterAirWaybillsLCLFinances($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("deleteallairwaybillslclfinances", name="deleteAllAirWaybillsLCLFinances", methods={"DELETE"})
     * @return JsonResponse
     */
    public function deleteAllAirWaybillsLCLFinances()
    {
        $result = $this->airwaybillLCLFinanceService->deleteAllAirWaybillsLCLFinances();

        return $this->response($result, self::DELETE);
    }

}