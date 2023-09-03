<?php

namespace App\Models;
use App\Models\Cart;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;
    protected $table = 'discount_code';
    protected  $primaryKey='id';
    protected $fillable = [
        'id',
        "code",
        "description",
        "date_end",
        "date_start",
        "discont_percentual",
        "permitted_uses",
        "uses_made",

    ];


    public function Cart(){
        return $this->belongsTo(Cart::class);
    }
}
