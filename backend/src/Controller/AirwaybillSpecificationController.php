<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\AirwaybillSpecificationCreateRequest;
use App\Request\DeleteRequest;
use App\Service\AirwaybillSpecificationService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AirwaybillSpecificationController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $airwaybillSpecificationService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, AirwaybillSpecificationService $airwaybillSpecificationService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->airwaybillSpecificationService = $airwaybillSpecificationService;
    }

    /**
     * @Route("airwaybillspecification", name="createAirwaybillSpecification", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Airwaybill Specification")
     * 
     * @OA\RequestBody(
     *      description="Create new airwaybill specification",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="name"),
     *          @OA\Property(type="number", property="weight", description="of type Float")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new airwaybill specification",
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

        $request = $this->autoMapping->map(stdClass::class, AirwaybillSpecificationCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->airwaybillSpecificationService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("airwaybillspecifications", name="getAllAirwaybillSpecification", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Airwaybill Specification")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns all airwaybill specifications",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="number", property="weight"),
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
     */
    public function getAllAirwaybillSpecifications()
    {
        $result = $this->airwaybillSpecificationService->getAllAirwaybillSpecifications();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("airwaybillspecification/{id}", name="deleteAirwaybillSpecification", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Airwaybill Specification")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted airwaybill specification",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="number", property="weight"),
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
     */
    public function deleteAirwaybillSpecificationById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->airwaybillSpecificationService->deleteAirwaybillSpecificationById($request);

        return $this->response($result, self::DELETE);
    }

}