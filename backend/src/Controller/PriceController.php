<?php

namespace App\Controller;

use App\AutoMapping;
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
     *          @OA\Property(type="number", property="oneCBMPrice")
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
     *              @OA\Property(type="integer", property="id"),
     *              @OA\Property(type="number", property="oneKiloPrice"),
     *              @OA\Property(type="number", property="oneCBMPrice"),
     *              @OA\Property(type="object", property="updatedAt"),
     *              @OA\Property(type="string", property="updatedByUser"),
     *              @OA\Property(type="string", property="updatedByUserImage")
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

}