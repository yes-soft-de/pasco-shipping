<?php

namespace App\Controller;

use App\AutoMapping;
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
     * @Route("unpackedshipments", name="getUnPackedShipments", methods={"GET"})
     * @return JsonResponse
     */
    public function getUnPackedShipments()
    {
        $result = $this->shipmentStatusService->getUnPackedShipments();

        return $this->response($result, self::FETCH);
    }

}