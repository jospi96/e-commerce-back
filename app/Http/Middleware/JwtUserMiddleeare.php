<?php

namespace App\Http\Middleware;

use App\Utils\CustomResponse;
use Closure;
use Illuminate\Http\Request;
use Lang;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Facades\JWTAuth;
use Lcobucci\JWT\Exception;


class JwtUserMiddleeare
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        try{

            $token= JWTAuth::parseToken()->authenticate();
          }catch(Exception $e){
            if($e instanceof TokenInvalidException){
              return CustomResponse::SetFailResponse(
                Lang::get('errors.token.invalid'),Response::HTTP_UNAUTHORIZED,"");
              
            } if($e instanceof TokenExpiredException){
              return CustomResponse::SetFailResponse(  Lang::get('errors.token.expired'),Response::HTTP_UNAUTHORIZED,"");
              
            }if($e instanceof TokenExpiredException){
              return CustomResponse::SetFailResponse(  Lang::get('errors.token.not_found'),Response::HTTP_NOT_FOUND,"");
  
          }
        }



       
        return $next($request);
   

    }}
