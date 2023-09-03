<?php

namespace App\Models\Cart;
use App\Models\Product;
use App\Models\Discount;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $table = 'cart';
    protected $fillable = [
        'id',
        'id_user',
        'total'
    ];

    public function product(){
        return $this->belongsToMany(
            Product::class)->withPivot("quantity_product");
    }

    public function discount(){
        return $this->belongsToMany(Discount::class);
    }
}
