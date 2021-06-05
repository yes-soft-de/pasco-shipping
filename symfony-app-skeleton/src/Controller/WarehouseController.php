<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\WarehouseCreateRequest;
use App\Request\WarehouseUpdateRequest;
use App\Service\WarehouseService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class WarehouseController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $warehouseService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, WarehouseService $warehouseService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->warehouseService = $warehouseService;
    }

    /**
     * @Route("warehouse", name="createWarehouse", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Warehouse")
     * 
     * @OA\RequestBody(
     *      description="Create new warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="integer", property="countryID"),
     *          @OA\Property(type="string", property="city"),
     *          @OA\Property(type="string", property="location"),
     *          @OA\Property(type="number", property="rentingFee"),
     *          @OA\Property(type="integer", property="proxyID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date info of the new warehouse",
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

        $request = $this->autoMapping->map(stdClass::class, WarehouseCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->warehouseService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("warehouse", name="updateWarehouse", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Warehouse")
     * 
     * @OA\RequestBody(
     *      description="Update a warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="string", property="countryID"),
     *          @OA\Property(type="string", property="city"),
     *          @OA\Property(type="string", property="rentingFee"),
     *          @OA\Property(type="string", property="proxyID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="countryID"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="object", property="rentingFee"),
     *                  @OA\Property(type="object", property="proxyID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="integer", property="createdBy"),
     *                  @OA\Property(type="integer", property="updatedBy"),     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, WarehouseUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->warehouseService->update($request);

        return $this->response($result, self::UPDATE);
    }

}