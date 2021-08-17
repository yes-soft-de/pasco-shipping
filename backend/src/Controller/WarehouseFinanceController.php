<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\WarehouseFinanceCreateRequest;
use App\Request\WarehouseFinanceFilterRequest;
use App\Service\WarehouseFinanceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class WarehouseFinanceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $warehouseFinanceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, WarehouseFinanceService $warehouseFinanceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->warehouseFinanceService = $warehouseFinanceService;
    }

    /**
     * @Route("warehousefinance", name="createWarehouseFinance", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Warehouse Finance")
     * 
     * @OA\RequestBody(
     *      description="Create new warehouse finance",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="warehouseID"),
     *          @OA\Property(type="number", property="cost"),
     *          @OA\Property(type="string", property="description"),
     *          @OA\Property(type="string", property="currency")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date info of the new warehouse finance",
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

        $request = $this->autoMapping->map(stdClass::class, WarehouseFinanceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->warehouseFinanceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filterwarehousefinance", name="filterWarehouseFinances", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Warehouse Finance")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="warehouseID")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Get the finances info of the warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="warehouseID"),
     *                  @OA\Property(type="number", property="cost"),
     *                  @OA\Property(type="string", property="description"),
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
    public function filterWarehouseFinances(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, WarehouseFinanceFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->warehouseFinanceService->filterWarehouseFinances($request);

        return $this->response($result, self::FETCH);
    }

}