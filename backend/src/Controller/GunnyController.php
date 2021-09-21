<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\GunnyCreateRequest;
use App\Request\GunnyFilterRequest;
use App\Service\GunnyService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class GunnyController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $gunnyService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, GunnyService $gunnyService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->gunnyService = $gunnyService;
    }

    /**
     * @Route("gunny", name="createGunny", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Gunny")
     *
     * @OA\RequestBody(
     *      description="Create new gunny",
     *      @OA\JsonContent()
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of all not-full gunny",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="id"),
     *                      @OA\Property(type="string", property="gunnyIdentificationNumber"),
     *                      @OA\Property(type="string", property="status"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt")
     *                  )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, GunnyCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->gunnyService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("filtergunnies", name="filterGunnies", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Gunny")
     *
     * @OA\RequestBody(
     *      description="Filter gunnies with following parameters",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="identificationNumber"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of gunnies",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *                  @OA\Items(
     *                      @OA\Property(type="integer", property="id"),
     *                      @OA\Property(type="string", property="gunnyIdentificationNumber"),
     *                      @OA\Property(type="string", property="status"),
     *                      @OA\Property(type="object", property="createdAt"),
     *                      @OA\Property(type="object", property="updatedAt"),
     *                      @OA\Property(type="string", property="createdByUser"),
     *                      @OA\Property(type="string", property="createdByUserImage")
     *                  )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function filterGunnies(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, GunnyFilterRequest::class, (object)$data);

        $result = $this->gunnyService->filterGunnies($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("gunny/{id}", name="deleteGunny", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Gunny")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted gunny",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     */
    public function deleteGunnyById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->gunnyService->deleteGunnyById($request);

        return $this->response($result, self::DELETE);
    }

}