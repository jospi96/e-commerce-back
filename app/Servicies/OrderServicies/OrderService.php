<?php

namespace App\Servicies\OrderServicies;

use App\Models\User;
use App\Repositories\Contract\ProductRepositoryInterface;
use App\Repositories\Contract\UserRepositoryInterface;

class OrderService
{

    public function __construct(
        protected ProductRepositoryInterface $productRepositoryInterface) {}
    //protected OrderRepositoryInterface $orderRepositoryInterface;

/*    public function createOrder(

OrderRequest $request
) {
if ($this->productCheck($request->product)) {
$data=$request->all();
$this->orderRepositoryInterface
->create($data)->product()->attach($data['product']);
}

}*/
    public function productCheck(
        array $products,

    ) {

        foreach ($products as $prod) {
            $product = $this->productRepositoryInterface->findByid($prod['id']);
            // dd($product);
            if ($product->quantity < $prod['quantity_products']) {
                return abort(500, 'One roduct is not aviable', $product);
            }

        }
        return true;
    }
    public function createOrder($data, $orderRepositoryInterface)
    {
        $order = $orderRepositoryInterface
            ->create($data);

        return $order;
    }

    public function productAttach($id, $data, $orderRepositoryInterface)
    {

        for ($i = 0; $i < count($data); $i++) {
            $productForAttach[$i] = [
                'order_id' => $id,
                'product_id' => $data[$i]['id'],
                'quantity_products' => $data[$i]['quantity_products'],
            ];
            $this->removeQty($data[$i]['id'], $data[$i]['quantity_products']);
        }
        $orderRepositoryInterface->attachProduct($id, $productForAttach);

    }

    public function totalOrder($order)
    {
        $total = 0;
        $shippingClasses = [];
        //products price sum
        foreach ($order['products'] as $product) {
            $prod = $this->productRepositoryInterface->findByid($product['id']);
            array_push($shippingClasses,$prod->id_shipping_class);
            $total = $total +
                (($prod->discount_price ? $prod->discount_price : $prod->list_price) * (
                $product['quantity_products']));
        }
        // apply discount code to price
        if (isset($order['id_discount_code']) && $order['id_discount_code'] > 0) {
            $discount = \App\Models\Discount::find($order['id_discount_code'])->first();

            if (
                date($discount->date_start) <= date("y-m-d") &&
                date($discount->date_end) <= date("y-m-d") &&
                $discount->permitted_uses > $discount->uses_made
            ) {
                $total -= ($total * $discount->discont_percentual / 100);
            }
        }
        $shipping=$this->selectScippingClass($shippingClasses);
        $total+=$shipping["cost"];


        //apply shipping cost

        return ["total"=>$total,"id_shipping_class"=>$shipping['id']];
    }

    public function deleteOrderProd($order)
    {
        $order->delete();

    }

    public function removeQty($id, $quantity)
    {
        $prod = $this->productRepositoryInterface->findByid($id);
        $qty = $prod->quantity - $quantity;
        $this->productRepositoryInterface
            ->changeQty($prod, $qty);
    }
    public function addQty($id, $quantity)
    {
        $prod = $this->productRepositoryInterface->findByid($id);
        $qty = $prod->quantity + $quantity;
        $this->productRepositoryInterface
            ->changeQty($prod, $qty);
    }

    public function selectScippingClass($shippingId)
    {
        $shippingCost = 0;
        $shippingAddForProduct = 0;
        $idClass=0;
        $i=0;
        foreach ($shippingId as $id) {
            $shipping=\App\Models\shippingClass\shippingClass::find($id);
            if($shipping->amount>$shippingCost){
                $idClass=$id;
                $shippingCost=$shipping->amount;
                $shippingAddForProduct=$shipping->add_for_item;

            }
            $i++;
        }
        $shippingCost=$shippingCost+($shippingAddForProduct*$i);

  
        return [ 
            'id'=>$idClass,
            'cost'=>$shippingCost
        ];
    }

    public function updateUser($data,$id,UserRepositoryInterface $userRepositoryInterface){
        $userRepositoryInterface->update($id,$data);

    }
}
