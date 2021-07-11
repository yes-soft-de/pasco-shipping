<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ContainerSpecificationCreateRequest;
use App\Request\DeleteRequest;
use App\Service\ContainerSpecificationService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ContainerSpecificationController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $containerSpecificationService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ContainerSpecificationService $containerSpecificationService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->containerSpecificationService = $containerSpecificationService;
    }

    /**
     * @Route("containerspecification", name="createContainerSpecification", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container Specification")
     * 
     * @OA\RequestBody(
     *      description="Create new container specification",
     *      @OA\JsonContent(
     *          @OA\Property(type="number", property="capacityCPM", description="of type Float"),
     *          @OA\Property(type="number", property="widthInMeter", description="of type Float"),
     *          @OA\Property(type="number", property="hightInMeter", description="of type Float"),
     *          @OA\Property(type="number", property="lengthInMeter", description="of type Float")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new specifications",
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

        $request = $this->autoMapping->map(stdClass::class, ContainerSpecificationCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerSpecificationService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("containerspecifications", name="getAllContainerSpecification", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container Specification")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns all container specifications",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="number", property="capacityCPM"),
     *                  @OA\Property(type="number", property="widthInMeter"),
     *                  @OA\Property(type="number", property="hightInMeter"),
     *                  @OA\Property(type="number", property="lengthInMeter"),
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
    public function getAllContainerSpecifications()
    {
        $result = $this->containerSpecificationService->getAllContainerSpecifications();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("containerspecification/{id}", name="deleteContainerSpecification", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Container Specification")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted container specification",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="number", property="capacityCPM"),
     *                  @OA\Property(type="number", property="widthInMeter"),
     *                  @OA\Property(type="number", property="hightInMeter"),
     *                  @OA\Property(type="number", property="lengthInMeter"),
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
    public function deleteContainerSpecificationById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->containerSpecificationService->deleteContainerSpecificationById($request);

        return $this->response($result, self::DELETE);
    }

}