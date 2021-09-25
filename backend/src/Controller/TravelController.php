<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\TravelCreateRequest;
use App\Request\TravelFilterRequest;
use App\Request\TravelStatusUpdateRequest;
use App\Request\TravelUpdateRequest;
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
     *          @OA\Property(type="integer", property="carrierID")
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
     * @Route("travel", name="updateTravel", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\RequestBody(
     *      description="Update a travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="string", property="launchCountry"),
     *          @OA\Property(type="string", property="destinationCountry"),
     *          @OA\Property(type="string", property="launchDate"),
     *          @OA\Property(type="string", property="arrivalDate"),
     *          @OA\Property(type="string", property="travelNumber"),
     *          @OA\Property(type="integer", property="shipperID"),
     *          @OA\Property(type="integer", property="carrierID")
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items()
     *                  )
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, TravelUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->travelService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("travelstatus", name="updateTravelStatus", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\RequestBody(
     *      description="Update the status of a travel",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="object", property="launchDate"),
     *          @OA\Property(type="object", property="arrivalDate")
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items()
     *                  )
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items()
     *                  )
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items()
     *                  )
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="integer", property="shipperID"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="integer", property="carrierID"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="integer", property="travelID"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="integer", property="holderID"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="integer", property="createdBy"),
     *                          @OA\Property(type="integer", property="updatedBy"),
     *                          @OA\Property(type="object", property="status"),
     *                          @OA\Property(type="object", property="specificationID"),
     *                          @OA\Property(type="integer", property="type"),
     *                          @OA\Property(type="integer", property="carrierID"),
     *                          @OA\Property(type="integer", property="totalGunny"),
     *                          @OA\Property(type="integer", property="totalReceivedShipmentsQuantity"),
     *                          @OA\Property(type="array", property="shipments",
     *                              @OA\Items(
     *                                  @OA\Property(type="integer", property="id"),
     *                                  @OA\Property(type="integer", property="shipmentID"),
     *                                  @OA\Property(type="string", property="trackNumber"),
     *                                  @OA\Property(type="integer", property="travelID"),
     *                                  @OA\Property(type="string", property="holderType"),
     *                                  @OA\Property(type="integer", property="holderID"),
     *                                  @OA\Property(type="object", property="createdAt"),
     *                                  @OA\Property(type="object", property="updatedAt"),
     *                                  @OA\Property(type="integer", property="createdBy"),
     *                                  @OA\Property(type="integer", property="updatedBy"),
     *                                  @OA\Property(type="integer", property="amount")
     *                              )
     *                          )
     *                      )
     *                  )
     *          )
     *      )
     * )
     * 
     */
    public function getTravelByID($id)
    {
        $result = $this->travelService->getTravelByID($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("filtertravels", name="filterTravels", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Travel")
     *
     * @OA\RequestBody(
     *      description="Post a request with filtering option",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="type"),
     *          @OA\Property(type="string", property="status"),
     *          @OA\Property(type="string", property="launchCountry"),
     *          @OA\Property(type="string", property="destinationCountry"),
     *          @OA\Property(type="string", property="launchDate"),
     *          @OA\Property(type="string", property="arrivalDate"),
     *          @OA\Property(type="string", property="travelNumber"),
     *          @OA\Property(type="integer", property="shipperID")
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items()
     *                  )
     *          )
     *      )
     * )
     *
     */
    public function filterTravels(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, TravelFilterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->travelService->filterTravels($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("travel/{id}", name="deleteTravel", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Travel")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted travel",
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
     *                  @OA\Property(type="string", property="subcontractName"),
     *                  @OA\Property(type="string", property="carrierName"),
     *                  @OA\Property(type="array", property="holders",
     *                      @OA\Items(
     *                          @OA\Property(type="integer", property="id"),
     *                          @OA\Property(type="integer", property="shipmentID"),
     *                          @OA\Property(type="string", property="trackNumber"),
     *                          @OA\Property(type="integer", property="travelID"),
     *                          @OA\Property(type="string", property="holderType"),
     *                          @OA\Property(type="integer", property="holderID"),
     *                          @OA\Property(type="object", property="createdAt"),
     *                          @OA\Property(type="object", property="updatedAt"),
     *                          @OA\Property(type="integer", property="createdBy"),
     *                          @OA\Property(type="integer", property="updatedBy"),
     *                          @OA\Property(type="object", property="0")
     *                      )
     *                  )
     *          )
     *      )
     * )
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->travelService->delete($request);

        return $this->response($result, self::DELETE);
    }

    /**
     * @Route("deletealltravels", name="deleteAllTravels", methods={"DELETE"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Travel")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the number of the travels being deleted",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                 @OA\Property(type="number", property="numbersOfItemDeleted")
     *                      )
     *                     )
     *          )
     * 
     * )
     * 
     * @Security(name="Bearer")
     */
    public function deleteAllTravels()
    {
        $result = $this->travelService->deleteAllTravels();

        return $this->response($result, self::DELETE);
    }

}