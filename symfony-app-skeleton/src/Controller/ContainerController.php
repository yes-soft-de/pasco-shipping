<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ContainerCreateRequest;
use App\Service\ContainerService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ContainerController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $containerService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ContainerService $containerService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->containerService = $containerService;
    }

    /**
     * @Route("container", name="createContainer", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container")
     * 
     * @OA\RequestBody(
     *      description="Create new container",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="string", property="containerNumber"),
     *          @OA\Property(type="string", property="status")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new container",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="object", property="updatedAt")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ContainerCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->containerService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("containers/{status}", name="getContainersByStatus", methods={"GET"})
     * @return JsonResponse
     * 
     * @OA\Tag(name="Container")
     * 
     * @OA\Parameter(
     *      name="status",
     *      in="path",
     *      required="true",
     *      description="the status of the container"
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the new container",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="specificationID"),
     *                  @OA\Property(type="string", property="containerNumber"),
     *                  @OA\Property(type="string", property="status"),
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
    public function getByStatus($status)
    {
        $result = $this->containerService->getByStatus($status);

        return $this->response($result, self::FETCH);
    }

}