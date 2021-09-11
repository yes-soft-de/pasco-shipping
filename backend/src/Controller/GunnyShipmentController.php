<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\GunnyShipmentCreateRequest;
use App\Service\GunnyShipmentService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class GunnyShipmentController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $gunnyShipmentService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, GunnyShipmentService $gunnyShipmentService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->gunnyShipmentService = $gunnyShipmentService;
    }

    /**
     * @Route("gunnyshipment", name="createGunnyShipment", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Gunny Shipment")
     *
     * @OA\RequestBody(
     *      description="Create new gunny shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="integer", property="gunnyID"),
     *          @OA\Property(type="integer", property="shipmentID"),
     *          @OA\Property(type="string", property="trackNumber"),
     *          @OA\Property(type="integer", property="quantity"),
     *          @OA\Property(type="string", property="gunnyStatus")
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the creation date and ID of the new gunny shipment record",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *              @OA\Property(type="integer", property="remainedQuantity"),
     *              @OA\Property(type="boolean", property="completedStored"),
     *              @OA\Property(type="object", property="gunnyShipment",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="integer", property="gunnyID"),
     *                  @OA\Property(type="integer", property="shipmentID"),
     *                  @OA\Property(type="string", property="trackNumber"),
     *                  @OA\Property(type="integer", property="quantity"),
     *                  @OA\Property(type="object", property="createdAt"),
     *                  @OA\Property(type="integer", property="createdBy"),
     *                  @OA\Property(type="integer", property="updatedBy"),
     *                  @OA\Property(type="object", property="updatedAt"),
     *              )
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, GunnyShipmentCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->gunnyShipmentService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("gunnyshipment/{id}", name="deleteGunnyShipmentItem", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Gunny Shipment")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted gunny shipment",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="integer", property="id"),
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     */
    public function deleteGunnyShipmentById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->gunnyShipmentService->deleteGunnyShipmentById($request, $this->getUserId());

        return $this->response($result, self::DELETE);
    }

}