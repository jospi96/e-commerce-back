<?php

namespace App\Http\Controllers\Brand;

use App\Http\Controllers\Controller;
use App\Repositories\Contract\BrandRepositoryInterface;
use Illuminate\Http\Request;

class BrandController extends Controller
{
   public function getAll(Request $request, BrandRepositoryInterface $brandRepositoryInterface){
    return $brandRepositoryInterface->paginator();
   }

}
