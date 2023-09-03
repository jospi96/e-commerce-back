<?php

namespace App\Http\Resources\Product;

use App\Http\Resources\Product\linkPrev;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductPreview extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $costumerOutput=[
            "id"=>$this->id,
            "title"=>$this->title,
            "list_price"=>$this->list_price,
            "discount_price"=>$this->discount_price,
            "quantity"=>$this->quantity,
            "img_url"=>linkPrev::collection($this->product_img_url),
           
        ];
        if(isset($this->pivot->quantity_product)){
         return   $costumerOutput+["cartQty"=>$this->pivot->quantity_product];
           
        }
       
        return $costumerOutput;
    }
}
