<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\PendingHolderCreateRequest;
use App\Service\PendingHolderService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class PendingHolderController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $pendingHolderService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, PendingHolderService $pendingHolderService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->pendingHolderService = $pendingHolderService;
    }

    /**
     * @Route("pendingholder", name="createPendingHolder", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Pending Holder")
     *
     * @OA\RequestBody(
     *      description="Create new pending holder",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="integer", property="specificationID"),
     *          @OA\Property(type="integer", property="carrierID"),
     *          @OA\Property(type="integer", property="portID"),
     *          @OA\Property(type="string", property="location"),
     *          @OA\Property(type="string", property="notes")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date of the new pending holder",
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

        $request = $this->autoMapping->map(stdClass::class, PendingHolderCreateRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->pendingHolderService->create($request);

        return $this->response($result, self::CREATE);
    }

}