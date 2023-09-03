<?php

namespace App\Http\Controllers\product;

use App\Http\Controllers\Controller;
use App\Http\Requests\allProductRequest;
use App\Http\Resources\Product\ProductAll;
use App\Http\Resources\Product\ProductPreview;
use App\Repositories\Contract\ProductRepositoryInterface;
use Illuminate\Http\Request;

class ProductController extends Controller
{
   /* public function getProducts(allProductRequest $request, ProductRepositoryInterface $productRepositoryInterface)
    {
        $limit = $request->only('limit');
        $products = $productRepositoryInterface->paginator((int) $limit['limit']);
        return ProductPreview::collection($products);
      
    }*/

    public function getProducts(allProductRequest $request, ProductRepositoryInterface $productRepositoryInterface)
    {
        $limit =isset($request->only('parm')['limit'])? $request->only('parm')['limit']:8;
        $parm=isset($request->only('parm')['parm'])? $request->only('parm')['parm']:"";
       
        $products = $productRepositoryInterface->paginator((int) $limit,$parm);
        return ProductPreview::collection($products);
      
    }

    public function getBrandProducts($id, Request $request, ProductRepositoryInterface $brandRepositoryInterface)
    {
        return ProductPreview::collection($brandRepositoryInterface->productBrand($id));
    }
    public function getSingleProduct($id, Request $request, ProductRepositoryInterface $productRepositoryInterface){
       
        return ProductAll::make($productRepositoryInterface->findByid($id));
    }

    public function discountProducts( Request $request, ProductRepositoryInterface $productRepositoryInterface){
        $limit =isset($request->only('limit')['limit'])? $request->only('limit')['limit']:4;
       
        $parm=isset($request->only('parm')['parm'])? $request->only('parm')['parm']:""; 
        return ProductPreview::collection($productRepositoryInterface->discountProducts( $limit,$parm));
    }

}
