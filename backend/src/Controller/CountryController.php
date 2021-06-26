<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\CountryCreateRequest;
use App\Request\DeleteRequest;
use App\Service\CountryService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CountryController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $countryService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, CountryService $countryService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->countryService = $countryService;
    }

    /**
     * @Route("country", name="createCountry", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Country")
     *
     * @OA\RequestBody(
     *      description="Create new country",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="name")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new country",
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

        $request = $this->autoMapping->map(stdClass::class, CountryCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->countryService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("countries", name="getAllCountries", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Country")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represent a country",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
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
        $result = $this->countryService->getAllCountries();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("country/{id}", name="deleteCountry", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Country")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted country",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="string", property="name"),
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
    public function deleteCountryById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->countryService->deleteCountryById($request);

        return $this->response($result, self::DELETE);
    }

}