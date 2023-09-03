<?php
namespace App\Repositories;
use App\Models\Cart\Cart;
use App\Repositories\Contract\CartRepositoryInterface;

/**
 * Summary of EloquentCartRepository
 */
class EloquentCartRepository implements CartRepositoryInterface
{
    /**
     * Summary of getModel
     * @return Cart
     */
    public function getModel()
    {
        return new Cart;
    }

    /**
     * Summary of create
     * @param array $data
     * @return mixed
     */
    public function create(array $data)
    {
        return $this->getModel()->create($data);
    }
    /**
     * Summary of update
     * @param int $id
     * @param array $data
     * @return mixed
     */
    public function update(int $id, array $data)
    {
       $cart=$this->getModel()->find($id);
        foreach($cart->product as $product){
            if($product->id==$data['product_id']){
              return $cart->product()->updateExistingPivot(
                $product->id, $data);
            }
        }
        return $this->getModel()->find($id)->product()->attach(array ($data));
    }

    /**
     * Summary of delete
     * @param int $id
     * @param array $data
     * @return int
     */
    public function delete(int $id, array $data)
    {
        return $this->getModel()
        ->find($id)
        ->product()
        ->detach( $data["product_id"] );
        }

    /**
     * Summary of findByid
     * @param mixed $id
     * @return mixed
     */
    public function findByid($id)
    {
        return $this->getModel()->find($id);
    }
    
    public function findByUser($id)
    {
        $cart= $this->getModel()
        ->with('product',"discount")
        ->firstWhere('id_user', $id);
        if(!$cart){
           $cart= $this->create(["id_user"=>$id]);
        }
        return $cart;
    }
}
