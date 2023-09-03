<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Utils\CustomResponse;
use Illuminate\Http\Request;
use Lang;
use \Symfony\Component\HttpFoundation\Response;

class LogoutController extends Controller {
    public function logout(Response $response) {
        auth()->logout();
        return CustomResponse::setSuccessResponse( Response::HTTP_OK, Lang::get( 'message.logout' ) );
    }
}
