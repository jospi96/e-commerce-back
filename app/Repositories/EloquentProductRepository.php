<?php

namespace App\Repositories;

use App\Models\Product;
use App\Repositories\Contract\ProductRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;
use Tymon\JWTAuth\Claims\Collection;

/**
 * Summary of EloquentUserRepository
 */
class EloquentProductRepository implements ProductRepositoryInterface
{

    public function getModel()
    {

        return new Product;
    }

    public function create(array $data)
    {

        return $this->getModel()->create($data);
    }

    public function update(int $id, array $data)
    {

        return $this->getModel()->find($data['id'])->update($data);
    }

    public function delete(int $id, array $data)
    {
        return $this->getModel()->destroy($data);
    }

    public function findByid($id)
    {
        $query = $this->getModel()
            ::with('product_img_url', 'brand', "category")
            ->find($id);

        return $query;
    }

    /**
     * Summary of paginator
     * @param int $num
     * @return Collection
     */
    public function paginator(int $num = 8, string $parm): LengthAwarePaginator
    {
        $query = $this->getModel()

            ::with('brand', 'product_img_url')
            ->where('title', "LIKE", "%" . $parm . "%")
            ->paginate($num);
        // dd($query);
        return $query;

    }
    public function productBrand(int $id, int $num = 25): LengthAwarePaginator
    {
        return $this->getModel()
            ->where('id_brand', $id)
            ->paginate($num);

    }

    /**
     * Summary of findByName
     * @param string $parm
     * @return LengthAwarePaginator
     */
    public function findByName(string $parm): LengthAwarePaginator
    {
        return $this->getModel()->where('title', "Like", $parm)
            ::with('brand', 'product_img_url')->paginate();

    }

    public function discountProducts(int $num = 8, string $parm): LengthAwarePaginator
    {
        return $this->getModel()
            ->where("discount_price", "!=", null)
            ->where('title', "LIKE", "%" . $parm . "%")
            ->paginate($num);
    }
public function changeQty($prod, $quantity){

 return $prod->update(["quantity"=>$quantity]);
}
}
