<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Http\Resources\Cart\Cart;
use App\Repositories\Contract\CartRepositoryInterface;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function userCart($user, CartRepositoryInterface $cartRepositoryInterface)
    {

        return Cart::make($cartRepositoryInterface->findByUser($user));
    }

    public function updade($id, Request $request, CartRepositoryInterface $cartRepositoryInterface)
    {
        $data = $request->all();
         $cartRepositoryInterface->update($id, $data);

    }
    public function delete($id, Request $request, CartRepositoryInterface $cartRepositoryInterface)
    {
        $data = $request->all();
        return $cartRepositoryInterface->delete($id, $data);

    }
}
