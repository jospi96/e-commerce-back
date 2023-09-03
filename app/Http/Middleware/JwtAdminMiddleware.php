<?php

namespace App\Http\Middleware;

use App\Utils\CustomResponse;
use Closure;
use Illuminate\Foundation\Console\ExceptionMakeCommand;
use Illuminate\Http\Request;
use Lang;
use Lcobucci\JWT\Exception;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;


class JwtAdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
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
      if(!$token->is_admin){
        return CustomResponse::SetFailResponse(  Lang::get('errors.token.is_not_admin'),Response::HTTP_UNAUTHORIZED,"");

      }
      
     
      return $next($request);
    }
}
