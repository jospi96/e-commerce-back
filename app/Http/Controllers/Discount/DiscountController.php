<?php

namespace App\Http\Controllers\Discount;

use App\Http\Controllers\Controller;
use App\Http\Resources\Cupon\Discount;
use App\Repositories\Contract\DiscountRepositoryInterface;
use Illuminate\Http\Request;



class DiscountController extends Controller
{
    public function getByCode(Request $request,DiscountRepositoryInterface $discountRepositoryInterface){
        $code=isset($request->only('code')['code'])? $request->only('code')['code']:'';
        return Discount::make($discountRepositoryInterface->findByCode($code));
        
        
    }
}
