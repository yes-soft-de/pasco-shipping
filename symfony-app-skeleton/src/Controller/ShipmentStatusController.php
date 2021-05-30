<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ShipmentStatusCreateRequest;
use App\Service\ShipmentStatusService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ShipmentStatusController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $shipmentStatusService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ShipmentStatusService $shipmentStatusService)
    {
        parent::__construct($serializer);

        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->shipmentStatusService = $shipmentStatusService;
    }

    /**
     * @Route("shipmentstatus", name="createShipmentStatus", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ShipmentStatusCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->shipmentStatusService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("unpackedshipments", name="getUnPackedShipments", methods={"GET"})
     * @return JsonResponse
     */
    public function getUnPackedShipments()
    {
        $result = $this->shipmentStatusService->getUnPackedShipments();

        return $this->response($result, self::FETCH);
    }

}