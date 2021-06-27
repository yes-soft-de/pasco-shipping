<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\AdminCreateRequest;
use App\Request\DeleteRequest;
use App\Service\AdminService;
use Nelmio\ApiDocBundle\Annotation\Security;
use OpenApi\Annotations as OA;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AdminController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $adminService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, AdminService $adminService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->adminService = $adminService;
    }

    /**
     * @Route("createadmin", name="adminCreate", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     *
     *
     * @OA\Tag(name="Admin")
     *
     * @OA\RequestBody(
     *      description="Creates admin/employee and profile at the same time",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="userID"),
     *          @OA\Property(type="string", property="password"),
     *          @OA\Property(type="string", property="userName"),
     *          @OA\Property(type="string", property="email"),
     *          @OA\Property(type="array", property="roles", description="set it when create employee",
     *              @OA\Items(example="ROLE_EMPLOYEE"))
     *              )
     *          )
     *      )
     * )
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the new admin's role",
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
    public function adminCreate(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, AdminCreateRequest::class, (object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) 
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->adminService->adminCreate($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("adminprofile", name="getAdminProfileByUserID", methods={"GET"})
     *
     *
     * @OA\Tag(name="Admin")
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
     *      description="Returns the profile of the signed-in admin/employee",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="object", property="Data",
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="phone")
     *          )
     *      )
     * )
     *
     * @Security(name="Bearer")
     *
     */
    public function getProfileByUserID()
    {
        $response = $this->adminService->getProfileByUserID($this->getUserId());

        return $this->response($response,self::FETCH);
    }

    /**
     * @Route("employees", name="getAllEmployees", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Admin")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns all employees",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="phone")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAllEmployees()
    {
        $response = $this->adminService->getAllEmployees();

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("administrators", name="getAllAdministrators", methods={"GET"})
     * @return JsonResponse
     *
     * @OA\Tag(name="Admin")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns all administrators",
     *      @OA\JsonContent(
     *          @OA\Property(type="string", property="status_code"),
     *          @OA\Property(type="string", property="msg"),
     *          @OA\Property(type="array", property="Data",
     *              @OA\Items(
     *                  @OA\Property(type="string", property="userName"),
     *                  @OA\Property(type="string", property="image"),
     *                  @OA\Property(type="string", property="phone")
     *              )
     *          )
     *      )
     * )
     *
     */
    public function getAllAdministrators()
    {
        $response = $this->adminService->getAllAdministrators();

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("admin/{id}", name="deleteAdmin", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     *
     * @OA\Tag(name="Admin")
     *
     * @OA\Response(
     *      response=200,
     *      description="Returns the info of the deleted admin/employee",
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
    public function deleteAdminById(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->adminService->deleteAdminById($request);

        return $this->response($result, self::DELETE);
    }

}
