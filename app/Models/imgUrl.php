<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class imgUrl extends Model
{
    protected $table = 'product_img_url';
    use HasFactory;

    protected $fillable = [

        "url_img",
        "is_cover_image",
    ];
    public function products()
    {
        return $this->belongsTo(Product::class, 'id_product');
    }

}
