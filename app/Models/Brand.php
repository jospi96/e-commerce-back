<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $table = 'brand';

    use HasFactory;
    protected  $primaryKey='id';
    protected $fillable = [
        'id',
        'brand_name',
        'brand_description',
        'brand_meta_title',
        'brand_meta_description',
        'brand_img_url'
    ];

    public function products()
    {
        return $this->hasMany(Product::class,'id_brand');
    }
}
