<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\TrackCreateRequest;
use App\Request\TrackUpdateRequest;
use App\Service\TrackService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class TrackController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $trackService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, TrackService $trackService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->trackService = $trackService;
    }

    /**
     * @Route("track", name="createTrack", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Track")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Create new track record",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails"),
     *          @OA\Property(type="boolean", property="isInOneHolder"),
     *          @OA\Property(type="boolean", property="packed"),
     *          @OA\Property(type="string", property="holderType"),
     *          @OA\Property(type="integer", property="holderID"),
     *          @OA\Property(type="integer", property="travelID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new track",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="holderType"),
     *                  @OA\Property(type="integer", property="holderID"),
     *                  @OA\Property(type="integer", property="travelID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, TrackCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->trackService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("track", name="updateTrack", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Track")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Update track record when shipment packed into container or when container uploaded onto travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="integer", property="holderID"),
     *          @OA\Property(type="integer", property="travelID"),
     *          @OA\Property(type="string", property="shipmentStatus"),
     *          @OA\Property(type="string", property="statusDetails")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new track",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="integer", property="holderType"),
     *                  @OA\Property(type="integer", property="holderID"),
     *                  @OA\Property(type="integer", property="travelID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, TrackUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->trackService->updateByHolderIdAndTrackNumber($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("trackshipment/{trackNumber}", name="getShipmentByTrackNumber", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Track")
     * 
     * @OA\Parameter(
     *      name="trackNumber",
     *      in="header",
     *      description="pass trackNumber of the shipment",
     *      required=true 
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns all the info of the shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="holderType"),
     *                  @OA\Property(type="integer", property="holderID"),
     *                  @OA\Property(type="array", property="holderInfo",
     *                      @OA\Items(
     *                          @OA\Property(type="string", property="identificationNumber"),
     *                          @OA\Property(type="string", property="status")
     *                      )
     *                  ),
     *                  @OA\Property(type="integer", property="travelID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="integer", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="orderCreationDate"),
     *                  @OA\Property(type="object", property="orderUpdatingDate"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="integer", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="markID"),
     *                  @OA\Property(type="integer", property="packetingBy"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="integer", property="guniQuantity"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="clientUsername"),
     *                  @OA\Property(type="string", property="clientUserImage"),
     *                  @OA\Property(type="string", property="trackCreatedByUser"),
     *                  @OA\Property(type="string", property="trackCreatedByUserImage"),
     *                  @OA\Property(type="string", property="trackUpdatedByUser"),
     *                  @OA\Property(type="string", property="trackUpdatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedByUserImage"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByUserImage")
     *          )
     *      )
     * )
     * 
     */
    public function getShipmentByTrackNumber($trackNumber)
    {
        $result = $this->trackService->getShipmentByTrackNumber($trackNumber);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("trackmyshipment/{trackNumber}", name="getMyShipmentByTrackNumber", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Track")
     *
     * @OA\Parameter(
     *      name="trackNumber",
     *      in="header",
     *      description="pass trackNumber of the shipment",
     *      required=true
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns all the info of the shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="string", property="holderType"),
     *                  @OA\Property(type="integer", property="holderID"),
     *                  @OA\Property(type="integer", property="travelID"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="boolean", property="isInOneHolder"),
     *                  @OA\Property(type="boolean", property="packed"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="string", property="distributorName"),
     *                  @OA\Property(type="string", property="exportWarehouseCity"),
     *                  @OA\Property(type="string", property="importWarehouseCity"),
     *                  @OA\Property(type="integer", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="orderCreationDate"),
     *                  @OA\Property(type="object", property="orderUpdatingDate"),
     *                  @OA\Property(type="string", property="productCategoryName"),
     *                  @OA\Property(type="integer", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="markID"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="object", property="guniQuantity"),
     *                  @OA\Property(type="string", property="updatedBy"),
     *                  @OA\Property(type="object", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="trackCreatedByUser"),
     *                  @OA\Property(type="string", property="trackUpdatedByUser"),
     *                  @OA\Property(type="string", property="shipmentStatusCreatedBy"),
     *                  @OA\Property(type="string", property="shipmentStatusUpdatedByBy")
     *          )
     *      )
     * )
     *
     */
    public function getMyShipmentByTrackNumber($trackNumber)
    {
        $result = $this->trackService->getShipmentByTrackNumberAndUserID($trackNumber, $this->getUserId());

        return $this->response($result, self::FETCH);
    }

}