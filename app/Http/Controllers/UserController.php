<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserModifyRequest;
use App\Http\Resources\user\UserIndexResurce;
use App\Http\Resources\user\UserShowResurce;
use App\Repositories\Contract\UserRepositoryInterface;
use App\Utils\CustomResponse;
use DB;
use Exception;
use Illuminate\Http\Request;
use Lang;
use Symfony\Component\HttpFoundation\Response;


class UserController extends Controller {

    public function index( Request $request, UserRepositoryInterface $userRepositoryInterface ) {

        $user =  $userRepositoryInterface->paginator( 30 );
        return UserIndexResurce::collection( $user );

    }

    public function show( UserRepositoryInterface $userRepositoryInterface ) {

        $user = $userRepositoryInterface->findByid( auth()->id() );
        return UserShowResurce::make( $user );

    }

    public function show_admin( $id, UserRepositoryInterface $userRepositoryInterface ) {

        $user = $userRepositoryInterface->findByid( $id );
        return UserShowResurce::make( $user );

    }

    public function update( UserModifyRequest $request, UserRepositoryInterface $userRepositoryInterface ) {
       
      
        $userData = $request->all();
        if ( $userData[ 'id' ] != auth()->id() ) {
            return CustomResponse::SetFailResponse( Lang::get( 'errors.token.is_not_admin' ), Response::HTTP_UNAUTHORIZED, '' );
        }
        $user = $userRepositoryInterface->update( 3, $request->all() );

        if ( !$user ) {
            return CustomResponse::SetFailResponse( Lang::get( 'errors.update.error' ), Response::HTTP_NOT_MODIFIED, '' );
        }

        return CustomResponse::setSuccessResponse( Response::HTTP_OK, Lang::get( 'errors.update.success' ) );

    }

    public function update_admin( UserModifyRequest $request, UserRepositoryInterface $userRepositoryInterface ) {
       
      
        $userData = $request->all();
        
        $user = $userRepositoryInterface->update( 3, $request->all() );

        if ( !$user ) {
            return CustomResponse::SetFailResponse( Lang::get( 'errors.update.error' ), Response::HTTP_NOT_MODIFIED, '' );
        }

        return CustomResponse::setSuccessResponse( Response::HTTP_OK, Lang::get( 'errors.update.success' ) );

    
}
}
