<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use App\Service\ProductCategoryService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ProductCategoryController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $productCategoryService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ProductCategoryService $productCategoryService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->productCategoryService = $productCategoryService;
    }

    /**
     * @Route("productcategory", name="createProductCategory", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Product Category")
     * 
     * @OA\RequestBody(
     *      description="Create new product category",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="name"),
     *          @OA\Property(type="string", property="description"),
     *          @OA\Property(type="string", property="hsCode")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new product category",
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

        $request = $this->autoMapping->map(stdClass::class, ProductCategoryCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->productCategoryService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("productcategory", name="updateProductCategory", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Product Category")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Update specific product category",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="integer", property="name"),
     *          @OA\Property(type="string", property="description"),
     *          @OA\Property(type="string", property="hsCode")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the product category",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="string", property="hscode"),
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

        $request = $this->autoMapping->map(stdClass::class, ProductCategoryUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->productCategoryService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("productcategories", name="getAllProductCategories", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Product Category")
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a product category",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="string", property="hscode"),
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
        $result = $this->productCategoryService->getAllProductCategories();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("productcategory/{id}", name="deleteProductCategory", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Product Category")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted Product Category",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
     *                  @OA\Property(type="string", property="description"),
     *                  @OA\Property(type="string", property="hscode"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *                  @OA\Property(type="string", property="createdByUser"),
     *                  @OA\Property(type="string", property="createdByUserImage"),
     *                  @OA\Property(type="string", property="updatedByUser"),
     *                  @OA\Property(type="string", property="updatedByUserImage")
     *          )
     *      )
     * )
     */
    public function deleteProductCategoryById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->productCategoryService->deleteProductCategoryById($request);

        return $this->response($result, self::DELETE);
    }

}