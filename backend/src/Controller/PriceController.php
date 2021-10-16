<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\PriceCreateRequest;
use App\Request\PriceUpdateRequest;
use App\Service\PriceService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class PriceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $priceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, PriceService $priceService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->priceService = $priceService;
    }

    /**
     * @Route("price", name="createPrices", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Price")
     *
     * @OA\RequestBody(
     *      description="create prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="number", property="oneKiloPrice"),
     *          @OA\Property(type="number", property="oneCBMPrice"),
     *          @OA\Property(type="integer", property="exportCountryID"),
     *          @OA\Property(type="string", property="exportCity"),
     *          @OA\Property(type="integer", property="importCountryID"),
     *          @OA\Property(type="string", property="importCity"),
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the created prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, PriceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->priceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("price", name="updateExistingPrices", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Price")
     *
     * @OA\RequestBody(
     *      description="Update existing prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="id"),
     *          @OA\Property(type="number", property="oneKiloPrice"),
     *          @OA\Property(type="number", property="oneCBMPrice"),
     *          @OA\Property(type="integer", property="exportCountryID"),
     *          @OA\Property(type="string", property="exportCity"),
     *          @OA\Property(type="integer", property="importCountryID"),
     *          @OA\Property(type="string", property="importCity")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the updated prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="integer", property="id"),
     *              @OA\Property(type="number", property="oneKiloPrice"),
     *              @OA\Property(type="number", property="oneCBMPrice"),
     *              @OA\Property(type="integer", property="exportCountryID"),
     *              @OA\Property(type="string", property="exportCity"),
     *              @OA\Property(type="integer", property="importCountryID"),
     *              @OA\Property(type="string", property="importCity"),
     *              @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, PriceUpdateRequest::class, (object)$data);

        $request->setUpdatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->priceService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("price", name="getPrices", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Price")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the updated prices",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="array", property="prices",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="id"),
     *                      @OA\Property(type="number", property="oneKiloPrice"),
     *                      @OA\Property(type="number", property="oneCBMPrice"),
     *                      @OA\Property(type="integer", property="exportCountryID"),
     *                      @OA\Property(type="string", property="exportCity"),
     *                      @OA\Property(type="integer", property="importCountryID"),
     *                      @OA\Property(type="string", property="exportCountryName"),
     *                      @OA\Property(type="string", property="importCountryName"),
     *                      @OA\Property(type="string", property="importCity"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="updatedByUser"),
     *                      @OA\Property(type="string", property="updatedByUserImage"),
     *                      @OA\Property(type="integer", property="createdBy"),
     *                      @OA\Property(type="integer", property="updatedBy"),
     *                  )
     *              ),
     *              @OA\Property(type="array", property="containerSpecifications",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="id"),
     *                      @OA\Property(type="string", property="name"),
     *                      @OA\Property(type="number", property="capacityCPM"),
     *                      @OA\Property(type="number", property="widthInMeter"),
     *                      @OA\Property(type="number", property="hightInMeter"),
     *                      @OA\Property(type="number", property="lengthInMeter"),
     *                      @OA\Property(type="number", property="price"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage"),
     *                      @OA\Property(type="string", property="updatedByUser"),
     *                      @OA\Property(type="string", property="updatedByUserImage")
     *                  )
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function getPrices()
    {
        $result = $this->priceService->getPrices();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("price/{id}", name="deletePrices", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Price")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the deleted prices record",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="object", property="createdAt")
     *              )
     *          )
     *      )
     * )
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->priceService->delete($request);

        return $this->response($result, self::DELETE);
    }

}