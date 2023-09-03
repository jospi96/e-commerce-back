<?php
namespace App\Http\Resources\Product;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class linkPrev extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $costumerOutput=[
            "url"=>$this->url_img,
            "cover"=>$this->is_cover_image,

        ];
       
        return $costumerOutput;
    }
}
