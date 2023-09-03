<?php

namespace App\Models\Order;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = "order";
    protected $fillable = [
        "id",
        "id_customer",
        "shipping_address",
        "shipping_postal_code",
        "shipping_country",
        "shipping_city"];
    use HasFactory;

    public function product()
    {
        return $this->belongsToMany(
            Product::class)->withPivot("quantity_products");
    }

    public function user()
    {
        return $this->hasOne(User::class);
    }

}
