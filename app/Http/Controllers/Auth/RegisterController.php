<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;
use App\Repositories\Contract\UserRepositoryInterface;
use App\Utils\CustomResponse;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegisterRequest;
use Lang;
use \Symfony\Component\HttpFoundation\Response;

class RegisterController extends Controller
{
    public function userRegister(RegisterRequest $request,UserRepositoryInterface $userRepositoryInterface){
        $userData=$request->all();
        $userData['password'] = Hash::make($userData['password']);
           
        $user= $userRepositoryInterface->create($userData);

        if($user!=null){
        }
        $token= auth()->attempt($request->only('email', 'password'));

        if(!$token){
            return CustomResponse::SetFailResponse(Lang::get('message.registrated.not_logining'),Response::HTTP_NOT_ACCEPTABLE,"");
            }
            
    return CustomResponse::setSuccessResponse(Response::HTTP_CREATED, Lang::get('message.registrated.logining'),"key",$token,$user);
    }
    
}
