<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Repositories\Contract\UserRepositoryInterface;
use Egulias\EmailValidator\Validation\EmailValidation;
use Illuminate\Http\Request;
use App\Utils\CustomResponse;
use Illuminate\Support\Facades\Mail;
use Lang;
use Lcobucci\JWT\Exception;
use Symfony\Component\HttpFoundation\Response;


class LoginController extends Controller
{
public function login(LoginRequest $request, UserRepositoryInterface $userRepositoryInterface){

    $token= auth()->attempt($request->only('email', 'password'));

        if(!$token){
        return CustomResponse::SetFailResponse(Lang::get('errors.login.error'),Response::HTTP_NOT_ACCEPTABLE,"");
        }
        return CustomResponse::setSuccessResponse(
            Response::HTTP_OK, Lang::get('message.login'),
            "key",$token,
            $userRepositoryInterface->findByEmail($request->only('email'))
        );

//response()->json(['token' => $token]);


}
}