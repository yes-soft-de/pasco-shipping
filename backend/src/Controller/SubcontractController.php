<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\SubcontractCreateRequest;
use App\Request\SubcontractUpdateRequest;
use App\Service\SubcontractService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class SubcontractController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $subcontractService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, SubcontractService $subcontractService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->subcontractService = $subcontractService;
    }

    /**
     * @Route("subcontract", name="createSubcontract", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Subcontract")
     * 
     * @OA\RequestBody(
     *      description="Create new subcontract",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="integer", property="serviceID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new subcontract",
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

        $request = $this->autoMapping->map(stdClass::class, SubcontractCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->subcontractService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("subcontract", name="updateSubcontract", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Subcontract")
     * 
     * @OA\RequestBody(
     *      description="Update a subcontract",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="integer", property="serviceID")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the subcontract",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="serviceType"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, SubcontractUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->subcontractService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("subcontracts", name="getAllSubcontracts", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Subcontract")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns all subcontracts",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="serviceName"),
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
    public function getAllSubcontracts()
    {
        $result = $this->subcontractService->getAllSubcontracts();

        return $this->response($result, self::FETCH);
    }

}