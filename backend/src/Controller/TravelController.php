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
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="string", property="launchCountry"),
     *          @OA\Property(type="string", property="destinationCountry"),
     *          @OA\Property(type="string", property="launchDate"),
     *          @OA\Property(type="string", property="arrivalDate"),
     *          @OA\Property(type="string", property="travelNumber"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new travel",
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
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="subcontractName")
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
     *      description="Returns array of object which each one represent the info of a travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="launchCountry"),
     *                  @OA\Property(type="string", property="destinationCountry"),
     *                  @OA\Property(type="object", property="launchDate"),
     *                  @OA\Property(type="object", property="arrivalDate"),
     *                  @OA\Property(type="string", property="travelNumber"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="subcontractName")
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

    /**
     * @Route("travels/{type}/{status}", name="getTravelsByTypeAndStatus", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\Parameter(
     *      name="type",
     *      in="path",
     *      required="true",
     *      description="the type of the travel"
     * )
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
     *      description="Returns array of object which each one represent the info of a travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="type"),
     *                  @OA\Property(type="string", property="launchCountry"),
     *                  @OA\Property(type="string", property="destinationCountry"),
     *                  @OA\Property(type="object", property="launchDate"),
     *                  @OA\Property(type="object", property="arrivalDate"),
     *                  @OA\Property(type="string", property="travelNumber"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="subcontractName")
     *              )
     *          )
     *      )
     * )
     * 
     */
    public function getTravelsByTypeAndStatus($type, $status)
    {
        $result = $this->travelService->getTravelsByTypeAndStatus($type, $status);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("travel/{id}", name="getTravelByID", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\Parameter(
     *      name="id",
     *      in="path",
     *      required="true",
     *      description="the id of the travel"
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
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="string", property="subcontractName")
     *          )
     *      )
     * )
     * 
     */
    public function getTravelsByID($id)
    {
        $result = $this->travelService->getTravelsByID($id);

        return $this->response($result, self::FETCH);
    }

}