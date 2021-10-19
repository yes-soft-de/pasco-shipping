<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ContainerSpecificationCreateRequest;
use App\Request\ContainerSpecificationPriceCreateRequest;
use App\Request\ContainerSpecificationPriceUpdateRequest;
use App\Request\DeleteRequest;
use App\Service\ContainerSpecificationPriceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ContainerSpecificationPriceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $containerSpecificationPriceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ContainerSpecificationPriceService $containerSpecificationPriceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->containerSpecificationPriceService = $containerSpecificationPriceService;
    }

    /**
     * @Route("containerspecificationprice", name="createContainerSpecificationPrice", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container Specification Price")
     * 
     * @OA\RequestBody(
     *      description="Create new container specification price for specific shipping line",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="containerSpecificationID"),
     *          @OA\Property(type="integer", property="exportCountryID"),
     *          @OA\Property(type="string", property="exportCity"),
     *          @OA\Property(type="integer", property="destinationPortID"),
     *          @OA\Property(type="number", property="price")
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

        $request = $this->autoMapping->map(stdClass::class, ContainerSpecificationPriceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerSpecificationPriceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("containerspecificationprice", name="updateContainerSpecificationPrice", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Container Specification Price")
     *
     * @OA\RequestBody(
     *      description="Create new container specification price",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="containerSpecificationID"),
     *          @OA\Property(type="integer", property="exportCountryID"),
     *          @OA\Property(type="string", property="exportCity"),
     *          @OA\Property(type="integer", property="destinationPortID"),
     *          @OA\Property(type="number", property="price")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new specifications price",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="containerSpecificationID"),
     *                  @OA\Property(type="integer", property="exportCountryID"),
     *                  @OA\Property(type="string", property="exportCity"),
     *                  @OA\Property(type="integer", property="destinationPortID"),
     *                  @OA\Property(type="number", property="price"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdBy"),
     *                  @OA\Property(type="string", property="updatedBy"),
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ContainerSpecificationPriceUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerSpecificationPriceService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("containerspecificationprices", name="getAllContainerSpecificationPrices", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Container Specification Price")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns all container specifications prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="containerSpecificationID"),
     *                  @OA\Property(type="string", property="containerSpecificationName"),
     *                  @OA\Property(type="integer", property="exportCountryID"),
     *                  @OA\Property(type="string", property="exportCountryName"),
     *                  @OA\Property(type="string", property="exportCity"),
     *                  @OA\Property(type="integer", property="destinationPortID"),
     *                  @OA\Property(type="string", property="destinationPortName"),
     *                  @OA\Property(type="number", property="price"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="integer", property="createdBy"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="integer", property="updatedBy"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAllContainerSpecificationPrices()
    {
        $result = $this->containerSpecificationPriceService->getAllContainerSpecificationPrices();

        return $this->response($result, self::FETCH);
    }

}