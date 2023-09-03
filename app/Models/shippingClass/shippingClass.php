<?php

namespace App\Models\shippingClass;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class shippingClass extends Model
{
    use HasFactory;
    protected $table='shipping_class';
    protected  $primaryKey='id';
    protected $fillable = [];

}
