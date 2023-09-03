<?php

namespace App\Http\Resources\Brand;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductBrand extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $costumerOutput=[
            "url"=>$this->brand_img_url,
            "id"=>$this->id,
            "name"=>$this->brand_name
        ];
        return  $costumerOutput;
    }
}
