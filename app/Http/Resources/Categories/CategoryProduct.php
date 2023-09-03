<?php
namespace App\Http\Resources\Categories;

use App\Http\Resources\Product\ProductPreview;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryProduct extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $costumerOutput = [
            "description" => $this->description,
            "img_url" => $this->img_url,
            "meta_description" => $this->meta_description,
            "meta_title" => $this->meta_title,
            "name" => $this->name,
            "product"=>ProductPreview::collection($this->product)

        ];

        return $costumerOutput;
    }
}
