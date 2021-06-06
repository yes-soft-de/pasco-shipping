<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\MarkCreateRequest;
use App\Service\MarkService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MarkController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $markService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, MarkService $markService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->markService = $markService;
    }

    /**
     * @Route("mark", name="createMark", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Mark")
     *
     * @OA\RequestBody(
     *      description="Create new mark",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="markNumber")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new mark",
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

        $request = $this->autoMapping->map(stdClass::class, MarkCreateRequest::class, (object)$data);

        $request->setClientUserID($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->markService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("mymarks", name="getAllMarksOfUser", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Mark")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of objects which each one represents the mark info",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="markNumber"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function getAllMarksByUser()
    {
        $result = $this->markService->getAllMarksByUser($this->getUserId());

        return $this->response($result, self::FETCH);
    }

}