<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
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
     *          @OA\Property(type="string", property="name"),
     *          @OA\Property(type="integer", property="countryID"),
     *          @OA\Property(type="string", property="city"),
     *          @OA\Property(type="string", property="location"),
     *          @OA\Property(type="number", property="rentingFee"),
     *          @OA\Property(type="integer", property="proxyID"),
     *          @OA\Property(type="integer", property="subcontractID")
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
     *          @OA\Property(type="integer", property="countryID"),
     *          @OA\Property(type="string", property="city"),
     *          @OA\Property(type="number", property="rentingFee"),
     *          @OA\Property(type="integer", property="proxyID"),
     *          @OA\Property(type="integer", property="subcontractID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="countryName"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="number", property="rentingFee"),
     *                  @OA\Property(type="string", property="proxyName"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *         )
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

    /**
     * @Route("warehouses", name="getAllWarehouses", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Warehouse")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns arrays of objects which each one represent a warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="countryName"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="number", property="rentingFee"),
     *                  @OA\Property(type="string", property="proxyName"),
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
     * @Security(name="Bearer")
     */
    public function getAllWarehouses()
    {
        $result = $this->warehouseService->getAllWarehouses();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("warehouse/{id}", name="deleteWarehouse", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Warehouse")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted warehouse",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="countryName"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="number", property="rentingFee"),
     *                  @OA\Property(type="string", property="proxyName"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *          )
     *      )
     * )
     */
    public function deleteWarehouseById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->warehouseService->deleteWarehouseById($request);

        return $this->response($result, self::DELETE);
    }

}