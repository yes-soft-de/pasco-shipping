<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\TravelCreateRequest;
use App\Request\TravelStatusUpdateRequest;
use App\Service\TravelService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class TravelController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $travelService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, TravelService $travelService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->travelService = $travelService;
    }

    /**
     * @Route("travel", name="createTravel", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\RequestBody(
     *      description="Create new travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new container",
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

        $request = $this->autoMapping->map(stdClass::class, TravelCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->travelService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("travelstatus", name="updateTravel", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\RequestBody(
     *      description="Update the status of a travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="status")
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
     *                  @OA\Property(type="string", property="launchCountry"),
     *                  @OA\Property(type="string", property="destinationCountry"),
     *                  @OA\Property(type="object", property="launchDate"),
     *                  @OA\Property(type="object", property="arrivalDate"),
     *                  @OA\Property(type="string", property="travelNumber"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="integer", property="createdBy"),
     *                  @OA\Property(type="integer", property="updatedBy"),
     *                  @OA\Property(type="integer", property="shipperID"),
     *                  @OA\Property(type="string", property="status"),
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function updateTravelStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, TravelStatusUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->travelService->updateTravelStatus($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("travels/{status}", name="getTravelsByStatus", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\Parameter(
     *      name="status",
     *      in="path",
     *      required="true",
     *      description="the status of the travel"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of object which each one represent the info of the order",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="clientUserID"),
     *                  @OA\Property(type="string", property="transportationType"),
     *                  @OA\Property(type="string", property="target"),
     *                  @OA\Property(type="integer", property="supplierID"),
     *                  @OA\Property(type="integer", property="distributorID"),
     *                  @OA\Property(type="integer", property="exportWarehouseID"),
     *                  @OA\Property(type="integer", property="importWarehouseID"),
     *                  @OA\Property(type="string", property="quantity"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="productCategoryID"),
     *                  @OA\Property(type="string", property="unit"),
     *                  @OA\Property(type="string", property="receiverName"),
     *                  @OA\Property(type="string", property="receiverPhoneNumber"),
     *                  @OA\Property(type="string", property="packetingBy"),
     *                  @OA\Property(type="integer", property="markID"),
     *                  @OA\Property(type="string", property="paymentTime"),
     *                  @OA\Property(type="number", format="float", property="weight"),
     *                  @OA\Property(type="string", property="qrCode"),
     *                  @OA\Property(type="string", property="guniQuantity"),
     *                  @OA\Property(type="string", property="updatedBy"),
     *                  @OA\Property(type="string", property="vehicleIdentificationNumber"),
     *                  @OA\Property(type="string", property="extraSpecification"),
     *                  @OA\Property(type="string", property="status")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getTravelsByStatus($status)
    {
        $result = $this->travelService->getTravelsByStatus($status);

        return $this->response($result, self::FETCH);
    }

}