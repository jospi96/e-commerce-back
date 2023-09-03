<?php

namespace App\Http\Resources\Cart;

use App\Http\Resources\Cupon\Discount;
use App\Http\Resources\Product\ProductPreview;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Cart extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $costumerOutput = [
            "id" => $this->id,
            "total" => $this->total,
            "id_user"=> $this->id_user,
            "products"=>ProductPreview::collection($this->product),
            "discount" => Discount::collection($this->discount),
            
        ];

        return  $costumerOutput;
    }
}
