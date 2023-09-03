<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Models\Cart\Cart;
use App\Models\User;
use App\Repositories\Contract\OrderRepositoryInterface;
use App\Repositories\Contract\ProductRepositoryInterface;
use App\Repositories\Contract\UserRepositoryInterface;
use App\Servicies\OrderServicies\OrderService;
use Braintree\ClientToken;
use Braintree\Gateway;
use Illuminate\Http\Request;
use Stripe\Charge;

class OrderController extends Controller
{

    public function generate(Request $request, Gateway $gateway)
    {

        $token = $gateway->clientToken()->generate();

        $data = [
            /*'success' => true,*/
            'token' => $token,
        ];

        return response()->json($data);
    }

    public function makePayment(Request $request, OrderRepositoryInterface $orderRepositoryInterface)
    {
        \Stripe\Stripe::setApiKey(config('services.stripe.secret'));
        $data = $request->all();
        $order = $orderRepositoryInterface->findByid($data["IdOrder"]);
        $costumer = User::where("id", $order->id_customer)->first();
        if ($order->status == "Pending Payment") {
            $charge = Charge::create([
                'amount' => $order->total * 100,
                'currency' => 'eur',
                'source' => $data["tokenStripe"]['id'],
                'description' => 'Saldo ordine N.' . $data["IdOrder"],
                'metadata' => [
                    "First Name" => $costumer->first_name,
                    "Last Name" => $costumer->last_name,
                    "Email" => $costumer->email,
                    "Phone" => $costumer->phone,
                    "Address" => $order->shipping_address,
                    "City" => $order->shipping_city,
                    "Post Code" => $order->shipping_postal_code,
                    "Country" => $order->shipping_country,

                ],
            ]);

            if ($charge->status == 'succeeded') {
                $order->status = "paid";
                $order->save();
                return response()->json(['status'=>200,'message' => 'payment made successfully']);

            } else {
                return response()->json(['status'=>404,'message' => 'Something went wrong']);

            }
        } else {
            return response()->json(['status'=>401,'message' => 'order already paid']);
        }
    }

    public function create(
        OrderRequest $request,
        ProductRepositoryInterface $productRepositoryInterface,
        OrderRepositoryInterface $orderRepositoryInterface,
        UserRepositoryInterface $userRepositoryInterface) {
        $orderService = new OrderService($productRepositoryInterface);
        $data = $request->all();

        if ($orderService->productCheck($data['products'])) {
            $order = $orderService->createOrder($data, $orderRepositoryInterface);
            $orderService
                ->productAttach(
                    $order->id, $data['products'], $orderRepositoryInterface);
        }
        $totOrder = $orderService->totalOrder($data);
        $order->total = $totOrder['total'];
        $order->status = "Pending Payment";
        $order->id_shipping_class = $totOrder['id_shipping_class'];
        $order->expected_delivery = date('Y/m/d', strtotime("+2 day"));
        $order->save();
        Cart::where("id_user", $order->id_customer)->delete();
        $userData=[
            "first_name"=>$data["first_name"],
            "last_name"=>$data["last_name"],
            "email"=>$data["email"]

        ];
        $orderService->updateUser($order->id_customer,$userData, $userRepositoryInterface);
        return $order;

    }

}
