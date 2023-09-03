<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Brand;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $fillable = [
        "quantity"
    ];


    public function brand()
    {
        return $this->belongsTo(Brand::class,'id_brand');
    }
    public function product_img_url()
    {
        return $this->hasMany(imgUrl::class,'id_product');
    }

    public function category(){
        return $this->belongsToMany(Category::class,'category_product');
    }

    public function cart(){
        return $this->hasMany(Cart::class);
    }
    public function order(){
        return $this->hasMany(Cart::class,);
    }

}
