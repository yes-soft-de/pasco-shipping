<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ShipmentFilterRequest;
use App\Request\UserUpdateRequest;
use App\Service\MainService;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MainController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $mainService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, MainService $mainService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->mainService = $mainService;
    }

    /**
     * @Route("statistics", name="getStatistics", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Main")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one holds statistics info",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="orders",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="number", property="waitingOrders"),
     *                      @OA\Property(type="number", property="acceptedOrders"),
     *                  ),
     *                  @OA\Property(type="object", property="travels",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="number", property="flight"),
     *                      @OA\Property(type="number", property="cruise")
     *                  ),
     *                  @OA\Property(type="object", property="users",
     *                      @OA\Property(type="number", property="total"),
     *                      @OA\Property(type="number", property="customers"),
     *                      @OA\Property(type="number", property="employees"),
     *                  )
     *          )
     *      )
     * )
     *
     */
    public function getStatistics()
    {
        $result = $this->mainService->getStatistics();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filter", name="filterShipments", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Main")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status", description="this field is required"),
     *          @OA\Property(type="string", property="paymentTime", description="this field is required"),
     *          @OA\Property(type="string", property="transportationType", description="this field is required"),
     *          @OA\Property(type="string", property="createdAt", example="2021-06-01T00:00:00.000"),
     *          @OA\Property(type="string", property="finishedAt", example="2021-06-01T00:00:00.000"),
     *          @OA\Property(type="string", property="launchCountry"),
     *          @OA\Property(type="string", property="targetCountry"),
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns one of two different responses, one for waiting shipment orders, and the other for accepted ones."
     * )
     *
     */
    public function filterShipments(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->mainService->filterShipments($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("changeuser", name="updateuser", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, UserUpdateRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->mainService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("allusers", name="getAllUsers", methods={"GET"})
     * @return JsonResponse
     */
    public function findAll()
    {
        $result = $this->mainService->findAll();

        return $this->response($result, self::UPDATE);
    }

}