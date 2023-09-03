<?php

namespace App\Http\Resources\Product;

use App\Http\Resources\Brand\ProductBrand;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Product\linkPrev;

class ProductAll extends JsonResource
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
            "description"=>$this->description,
            "list_price"=>$this->list_price,
            "discount_price"=>$this->discount_price,
            "meta_title"=>$this->meta_title,
            "meta_description"=>$this->meta_description,
            "quantity"=>$this->quantity,
            "weight"=>$this->weight,
            "height"=>$this->height,
            "width"=>$this->width,
            "status"=>$this->status,
            "brand"=>ProductBrand::make($this->brand),
            "img_url"=>linkPrev::collection($this->product_img_url),
            "categories"=>$this->category
            



        ];
        return  $costumerOutput;
    }
}
