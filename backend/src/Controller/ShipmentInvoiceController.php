<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ShipmentInvoiceCreateRequest;
use App\Request\ShipmentInvoiceFilterRequest;
use App\Request\ShipmentInvoiceUpdatePaymentInfoRequest;
use App\Request\ShipmentInvoiceUpdateRequest;
use App\Service\ShipmentInvoiceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentInvoiceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentInvoiceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentInvoiceService $shipmentInvoiceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentInvoiceService = $shipmentInvoiceService;
    }

    /**
     * @Route("shipmentinvoice", name="createShipmentInvoice", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Invoice")
     *
     * @OA\RequestBody(
     *      description="Create new shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="integer", property="discount"),
     *          @OA\Property(type="string", property="notes")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="paymentStatus"),
     *                  @OA\Property(type="object", property="paymentDate"),
     *                  @OA\Property(type="integer", property="paidBy"),
     *                  @OA\Property(type="string", property="paidOnBehalfBy"),
     *                  @OA\Property(type="string", property="invoiceImage"),
     *                  @OA\Property(type="string", property="receiptImage"),
     *                  @OA\Property(type="integer", property="totalCost"),
     *                  @OA\Property(type="integer", property="discount"),
     *                  @OA\Property(type="string", property="notes"),
     *                  @OA\Property(type="object", property="billDetails")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentInvoiceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentInvoiceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("shipmentinvoice", name="updateShipmentInvoice", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Invoice")
     *
     * @OA\RequestBody(
     *      description="Update existing shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="invoiceImage"),
     *          @OA\Property(type="string", property="receiptImage"),
     *          @OA\Property(type="integer", property="discount"),
     *          @OA\Property(type="string", property="notes")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="paymentStatus"),
     *                  @OA\Property(type="object", property="paymentDate"),
     *                  @OA\Property(type="integer", property="paidBy"),
     *                  @OA\Property(type="string", property="paidOnBehalfBy"),
     *                  @OA\Property(type="string", property="invoiceImage"),
     *                  @OA\Property(type="string", property="receiptImage"),
     *                  @OA\Property(type="integer", property="totalCost"),
     *                  @OA\Property(type="integer", property="discount"),
     *                  @OA\Property(type="string", property="notes"),
     *                  @OA\Property(type="object", property="billDetails")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentInvoiceUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentInvoiceService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("shipmentinvoicepaymentinfo", name="updateShipmentInvoicePaymentInfo", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Invoice")
     *
     * @OA\RequestBody(
     *      description="Update existing shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="paymentStatus"),
     *          @OA\Property(type="object", property="paymentDate"),
     *          @OA\Property(type="integer", property="paidBy"),
     *          @OA\Property(type="string", property="paidOnBehalfBy")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="paymentStatus"),
     *                  @OA\Property(type="object", property="paymentDate"),
     *                  @OA\Property(type="integer", property="paidBy"),
     *                  @OA\Property(type="string", property="paidOnBehalfBy"),
     *                  @OA\Property(type="string", property="invoiceImage"),
     *                  @OA\Property(type="string", property="receiptImage"),
     *                  @OA\Property(type="integer", property="totalCost"),
     *                  @OA\Property(type="integer", property="discount"),
     *                  @OA\Property(type="string", property="notes"),
     *                  @OA\Property(type="object", property="billDetails")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function updatePaymentInfo(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentInvoiceUpdatePaymentInfoRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentInvoiceService->updatePaymentInfo($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("filtershipmentinvoices", name="filterShipmentInvoices", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Invoice")
     *
     * @OA\RequestBody(
     *      description="Filtering options",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="paymentStatus")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="paidByClient"),
     *                  @OA\Property(type="string", property="clientUserName"),
     *                  @OA\Property(type="integer", property="clientUserID"),
     *                  @OA\Property(type="string", property="clientImage"),
     *                  @OA\Property(type="object", property="clientPhone"),
     *                  @OA\Property(type="string", property="clientLocation"),
     *                  @OA\Property(type="string", property="clientCity"),
     *                  @OA\Property(type="object", property="clientCountry"),
     *                  @OA\Property(type="string", property="clientIdentificationNumber"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="integer", property="target"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="paymentStatus"),
     *                  @OA\Property(type="object", property="paymentDate"),
     *                  @OA\Property(type="integer", property="paidBy"),
     *                  @OA\Property(type="string", property="paidOnBehalfBy"),
     *                  @OA\Property(type="string", property="invoiceImage"),
     *                  @OA\Property(type="string", property="receiptImage"),
     *                  @OA\Property(type="integer", property="totalCost"),
     *                  @OA\Property(type="integer", property="discount"),
     *                  @OA\Property(type="string", property="notes"),
     *                  @OA\Property(type="object", property="billDetails")
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function filterShipmentInvoices(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentInvoiceFilterRequest::class, (object)$data);

        $result = $this->shipmentInvoiceService->filterShipmentInvoices($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("shipmentinvoice/{id}", name="deleteShipmentInvoice", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Shipment Invoice")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted shipment invoice",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="paymentStatus"),
     *                  @OA\Property(type="object", property="paymentDate"),
     *                  @OA\Property(type="integer", property="paidBy"),
     *                  @OA\Property(type="string", property="paidOnBehalfBy"),
     *                  @OA\Property(type="string", property="invoiceImage"),
     *                  @OA\Property(type="string", property="receiptImage"),
     *                  @OA\Property(type="integer", property="totalCost"),
     *                  @OA\Property(type="integer", property="discount"),
     *                  @OA\Property(type="string", property="notes"),
     *                  @OA\Property(type="object", property="billDetails")
     *          )
     *      )
     * )
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->shipmentInvoiceService->delete($request);

        return $this->response($result, self::DELETE);
    }

}