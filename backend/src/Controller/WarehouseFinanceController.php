<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\WarehouseFinanceCreateRequest;
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
     *          @OA\Property(type="string", property="description")
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

}