<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class Product extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products=  \App\Models\Product::factory()->count(50)
        ->create()->each();
        $products->save();
    }
}
