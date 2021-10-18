<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ShiftingShipmentOrderCreateRequest;
use App\Request\ShiftingShipmentOrderFilterRequest;
use App\Request\ShiftingShipmentOrderStatusUpdateRequest;
use App\Service\ShiftingShipmentOrderService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShiftingShipmentOrderController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shiftingShipmentOrderService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShiftingShipmentOrderService $shiftingShipmentOrderService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shiftingShipmentOrderService = $shiftingShipmentOrderService;
    }

    /**
     * @Route("ordershiftingshipment", name="createShiftingShipmentOrder", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shifting Shipment Order")
     *
     * @OA\RequestBody(
     *      description="Create new shifting shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="integer", property="toImportWarehouseID"),
     *          @OA\Property(type="string", property="notes")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shifting shipment order",
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

        $request = $this->autoMapping->map(stdClass::class, ShiftingShipmentOrderCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shiftingShipmentOrderService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("ordershiftingshipment", name="updateShiftingShipmentOrderStatus", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shifting Shipment Order")
     *
     * @OA\RequestBody(
     *      description="Create new shifting shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shifting shipment order",
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
    public function updateStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShiftingShipmentOrderStatusUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shiftingShipmentOrderService->updateStatus($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("filtershiftingshipmentorders", name="filterShiftingShipmentOrders", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shifting Shipment Order")
     *
     * @OA\RequestBody(
     *      description="filtering options",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="fromImportWarehouseID"),
     *          @OA\Property(type="integer", property="toImportWarehouseID"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shifting shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="id"),
     *                      @OA\Property(type="integer", property="shipmentID"),
     *                      @OA\Property(type="string", property="trackNumber"),
     *                      @OA\Property(type="integer", property="fromImportWarehouseID"),
     *                      @OA\Property(type="string", property="fromImportWarehouseName"),
     *                      @OA\Property(type="string", property="fromImportWarehouseCity"),
     *                      @OA\Property(type="integer", property="toImportWarehouseID"),
     *                      @OA\Property(type="string", property="toImportWarehouseName"),
     *                      @OA\Property(type="string", property="toImportWarehouseCity"),
     *                      @OA\Property(type="string", property="notes"),
     *                      @OA\Property(type="string", property="paymentStatus"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt")
     *                  )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function filterShiftingShipmentOrders(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShiftingShipmentOrderFilterRequest::class, (object)$data);

        $result = $this->shiftingShipmentOrderService->filterShiftingShipmentOrders($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shiftingshipmentorder/{id}", name="deleteShiftingShipmentOrder", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shifting Shipment Order")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted shifting shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->shiftingShipmentOrderService->delete($request);

        return $this->response($result, self::DELETE);
    }

    /**
     * @Route("forcedeleteshiftingshipmentorder/{id}", name="forceDeleteShiftingShipmentOrder", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shifting Shipment Order")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted shifting shipment order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     */
    public function forceDelete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->shiftingShipmentOrderService->forceDelete($request);

        return $this->response($result, self::DELETE);
    }

}