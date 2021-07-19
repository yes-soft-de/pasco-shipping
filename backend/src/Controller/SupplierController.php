<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\SupplierCreateRequest;
use App\Request\SupplierUpdateRequest;
use App\Service\SupplierService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class SupplierController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $supplierService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, SupplierService $supplierService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->supplierService = $supplierService;
    }

    /**
     * @Route("supplier", name="createSupplier", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Supplier")
     *
     * @OA\RequestBody(
     *      description="Create new supplier",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="string", property="address")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new supplier",
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

        $request = $this->autoMapping->map(stdClass::class, SupplierCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->supplierService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("supplier", name="updateSupplier", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Supplier")
     *
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true
     * )
     *
     * @OA\RequestBody(
     *      description="Update a specific supplier",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="string", property="fullName"),
     *          @OA\Property(type="string", property="phone"),
     *          @OA\Property(type="string", property="address")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the supplier",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="address"),
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

        $request = $this->autoMapping->map(stdClass::class, SupplierUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->supplierService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("suppliers", name="getAllSuppliers", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Supplier")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a supplier",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="address"),
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
    public function getAll()
    {
        $result = $this->supplierService->getAllSuppliers();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("supplier/{id}", name="deleteSupplier", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Supplier")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted supplier",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="fullName"),
     *                  @OA\Property(type="string", property="phone"),
     *                  @OA\Property(type="string", property="address"),
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
     */
    public function deleteSupplierById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->supplierService->deleteSupplierById($request);

        return $this->response($result, self::DELETE);
    }

}