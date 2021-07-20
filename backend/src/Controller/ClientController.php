<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ClientProfileUpdateRequest;
use App\Request\ClientRegisterRequest;
use App\Request\DeleteRequest;
use App\Service\ClientService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ClientController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $clientService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ClientService $clientService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->clientService = $clientService;
    }

    /**
     * @Route("/client", name="clientRegister", methods={"POST"})
     *
     * @OA\Tag(name="Client")
     *
     * @OA\RequestBody(
     *      description="Creates client and profile at the same time",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="userID"),
     *          @OA\Property(type="string", property="password"),
     *          @OA\Property(type="string", property="userName"),
     *          @OA\Property(type="string", property="email")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the new client's role and the creation date",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="array", property="roles",
     *                      @OA\Items(example="user")),
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     *
     */
    public function clientRegister(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ClientRegisterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->clientService->clientRegister($request);

        return $this->response($response, self::CREATE);
    }

    // /**
    //  * @Route("/userprofile", name="userProfileCreate", methods={"POST"})
    //  * @param Request $request
    //  * @return JsonResponse
    //  */
    // public function userProfileCreate(Request $request)
    // {
    //     $data = json_decode($request->getContent(), true);

    //     $request = $this->autoMapping->map(stdClass::class,UserProfileCreateRequest::class,(object)$data);

    //     $request->setUserID($this->getUserId());

    //     $violations = $this->validator->validate($request);
    //     if (\count($violations) > 0) {
    //         $violationsString = (string) $violations;

    //         return new JsonResponse($violationsString, Response::HTTP_OK);
    //     }

    //     $response = $this->userService->userProfileCreate($request);

    //     return $this->response($response, self::CREATE);
    // }

    /**
     * @Route("clientprofile", name="updateClientProfile", methods={"PUT"})
     * 
     * @OA\Tag(name="Client")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\RequestBody(
     *      description="Updates the profile of the signed-in user",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="id"),
     *          @OA\Property(type="string", property="userID"),
     *          @OA\Property(type="string", property="userName"),
     *          @OA\Property(type="string", property="image"),
     *          @OA\Property(type="string", property="city"),
     *          @OA\Property(type="string", property="country"),
     *          @OA\Property(type="string", property="location"),
     *          @OA\Property(type="string", property="phone")
     *      )
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the updated profile of the user",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="country"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="string", property="phone")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function updateClientProfile(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ClientProfileUpdateRequest::class, (object)$data);
        
        $request->setUserID($this->getUserId());

        $response = $this->clientService->clientProfileUpdate($request);

        return $this->response($response, self::UPDATE);
    }

    /**
     * @Route("clientprofile", name="getClientProfileByID",methods={"GET"})
     * 
     * @OA\Tag(name="Client")
     * 
     * @OA\Parameter(
     *      name="token",
     *      in="header",
     *      description="token to be passed as a header",
     *      required=true 
     * )
     * 
     * @OA\Response(
     *      response=200,
     *      description="Returns the profile of the signed-in client",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="country"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="string", property="phone")
     *          )
     *      )
     * )
     * 
     * @Security(name="Bearer")
     */
    public function getClientProfileByID()
    {
        $response = $this->clientService->getClientProfileByUserID($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("clientprofileall", name="clientProfileAll", methods={"GET"})
     *
     * @OA\Tag(name="Client")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns array of all clients profiles",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="city"),
     *                  @OA\Property(type="string", property="country"),
     *                  @OA\Property(type="string", property="location"),
     *                  @OA\Property(type="string", property="phone")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function clientProfilesAll()
    {
        $response = $this->clientService->getAllClientProfiles();

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("client/{id}", name="deleteClient", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Client")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted client",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="array", property="roles",
     *                      @OA\Items(example="user")),
     *                  @OA\Property(type="object", property="createdAt")
     *          )
     *      )
     * )
     *
     */
    public function deleteClientById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->clientService->deleteClientById($request);

        return $this->response($result, self::DELETE);
    }

}
